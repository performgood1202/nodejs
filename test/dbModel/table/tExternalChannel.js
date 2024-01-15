const Model = require('../baseDbModel')
const dateHelper = require('../../Util/dateTime')
const dbHelper = require('./dbHelper')
const dbConstants = require('../dbConstants')

class ExternalChannelTable extends Model {
    constructor(row, username, type, refId) {
        super('tExternalChannel')
        if (undefined !== row) {

            this.name = row.name || ''
            this.externalApiTypeId = type
            this.refId = refId
            this.sKey = row.sKey || ''
            this.channel = row.channel || ''
            this.token = row.token || ''
            this.tokenJson = row.tokenJson || ''
            this.link = row.link || ''
            this.notes = row.notes || ''
            this.comments = row.comments || ''
            this.ts = dateHelper.getTimeStamp()
            this.createdBy = username
            this.updatedDate = dateHelper.getDateTimeNowUtc("YYYY/MM/DD");
            this.isActive = 1;
        }
    }


    async findById(uid) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE uid=?;'
        try {
            const result = await super.executeSql(sql, [uid])
            return dbHelper.getFirstRow(result);
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async findForUserById(refId) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE refId=? and (refId=? or refId = ?);'
        try {
            const result = await super.executeSql(sql, [refId, dbConstants.externalApiType.line_user, dbConstants.externalApiType.veeva_user])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async findForOrgById(refId) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE refId=? and (refId=? or refId = ?);'
        try {
            const result = await super.executeSql(sql, [refId, dbConstants.externalApiType.line_org, dbConstants.externalApiType.veeva_org])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async update(username, uid, row) {
        let columnValues = []
        const columnNames = []

        let sql = "UPDATE " + this.tableName + " SET "


        dbHelper.prepareUpdate(row, columnNames, columnValues)

        columnNames.push(`updatedDate= '${row.updatedDate || dateHelper.getDateTimeNowUtc("YYYY/MM/DD")}'`)
        columnNames.push('ts=?')
        sql += columnNames.join(',')
        sql += " WHERE uid = ?"
        columnValues.push(dateHelper.getTimeStamp())
        columnValues.push(uid)
        try {
            const result = await super.executeSql(sql, columnValues)
            if (result.affectedRows > 0) {
                return await this.findById(row.uid)
            }
            return undefined
        } catch (ex) {
            console.log(ex);
            throw ex
        }

    }

    async remove(uid) {
        let sql = 'delete  FROM ' + this.tableName + ' WHERE uid=?;'
        try {
            const result = await super.executeSql(sql, [uid])
            return dbHelper.getFirstRow(result);
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

}
module.exports = ExternalChannelTable
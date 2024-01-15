const Model = require('../baseDbModel')
const dateHelper = require('../../Util/dateTime')
const dbHelper = require('./dbHelper')

class OrgSettingsTable extends Model {
    constructor(row, /* username */) {
        super('tOrgSettings')
        if (undefined !== row) {


            this.orgId = row.orgId
            this.canSalesTransferToSales = row.canSalesTransferToSales
            this.canMslTransferToMsl = row.canMslTransferToMsl
            this.canSalesTransferToMsl = row.canSalesTransferToMsl
            this.canMslTransferToSales = row.canMslTransferToSales
            this.autoReleaseTimeForHangingThread = row.autoReleaseTimeForHangingThread
            this.autoCloseTimeForNoReplyThread = row.autoCloseTimeForNoReplyThread
            this.minTimeGapRequiredToCreateNewThread = row.minTimeGapRequiredToCreateNewThread
            this.notificationEmail = row.notificationEmail || ''
            this.pwd = row.pwd || ''




            this.ts = dateHelper.getTimeStamp()
            this.updatedDate = dateHelper.getDateTimeNowUtc("YYYY/MM/DD HH:mm:ss");

        }
    }


    async findById(uid) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE uid=?;'
        try {
            const result = await super.executeSql(sql, [uid])
            return result[0];
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async findByOrgId(id) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE orgId=?;'
        try {
            const result = await super.executeSql(sql, [id])
            return result[0]
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

        columnNames.push(`updatedDate= '${dateHelper.getDateTimeNowUtc("YYYY/MM/DD HH:mm:ss")}'`)
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
module.exports = OrgSettingsTable
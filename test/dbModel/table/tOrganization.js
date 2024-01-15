const Model = require('../baseDbModel')
const dateHelper = require('../../Util/dateTime')
const dbHelper = require('./dbHelper')

class OrganizationTable extends Model {
    constructor(row, username) {
        super('tOrganization')
        if (undefined !== row) {

            this.name = row.name
            this.website = row.website || ''
            this.head = row.head || 0
            this.phone = row.phone || ''
            this.email = row.email

            this.language = row.language || 'en'
            this.comments = row.comments || ''
            this.notes = row.notes || ''
            this.accessToken = row.accessToken;
            this.orgUserId = row.orgUserId || ''
            this.ts = dateHelper.getTimeStamp()
            this.createdBy = username
            this.updatedDate = dateHelper.getDateTimeNowUtc("YYYY/MM/DD");
            this.isActive = 1;

        }
    }

    async getAll() {
        try {
            let sql = 'SELECT * FROM ' + this.tableName + ';';
            const result = await super.executeSql(sql, []);
            return result[0];
        } catch (ex) {
            console.log(ex);
            throw ex;
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
module.exports = OrganizationTable


const Model = require('../baseDbModel')
const dateHelper = require('../../Util/dateTime')
const dbHelper = require('./dbHelper')
// const md5 = require('md5')
// const { isRowAffected } = require('./dbHelper')

class UserHcpTable extends Model {
    constructor(row, /* adminName */) {
        super('tUserHcp')
        if (undefined !== row) {


            this.prefix = row.prefix || '';
            this.fName = row.fName
            this.lName = row.lName || ''
            this.externalUserId = row.externalUserId
            this.personalSupportAgentId = row.personalSupportAgentId || 0

            this.email = row.email
            this.phone = row.phone
            this.dob = row.dob || ''
            this.gender = row.gender || ''
            this.orgId = row.orgId
            this.notes = row.notes || ''
            this.comments = row.comments || ''
            this.veevaLink = row.veevaLink || ''
            this.city = row.city || ''
            this.state = row.state || ''
            this.country = row.country || ''

            this.mapLocation = row.mapLocation || ''
            this.udf1 = row.udf1 || ''
            this.udf2 = row.udf2 || 0
            this.ts = dateHelper.getTimeStamp()
            this.isActive = 1;

        }
    }

    async getAll() {
        let sql = 'SELECT uid,prefix,fName,lName,email,phone,orgId,externalUserId,personalSupportAgentId,notes,comments,ts,veevaLink,roleId FROM ' + this.tableName + ';'
        try {
            const result = await super.executeSql(sql, [])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async getAll_org(orgId) {
        let sql = 'SELECT uid,prefix,fName,lName,email,phone,orgId,externalUserId,personalSupportAgentId,notes,comments,ts,veevaLink,roleId FROM ' + this.tableName + ' WHERE orgId=?;'
        try {
            const result = await super.executeSql(sql, [orgId])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async findById(uid) {
        let sql = 'SELECT uid,prefix,fName,lName,email,phone,orgId,externalUserId,personalSupportAgentId,notes,comments,ts,veevaLink,roleId FROM ' + this.tableName + ' WHERE uid=?;'
        try {
            const result = await super.executeSql(sql, [uid])
            return result[0];
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async findByExternalUserId(externalUserId) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE externalUserId=?;'
        try {
            const result = await super.executeSql(sql, [externalUserId])
            return result[0];
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async findByExternalUserId_OrgId(externalUserId, orgId) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE externalUserId=? and orgId=?;'
        try {
            const result = await super.executeSql(sql, [externalUserId, orgId])
            return result[0];
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async update(uid, row) {
        let columnValues = []
        const columnNames = []

        let sql = "UPDATE " + this.tableName + " SET "


        dbHelper.prepareUpdate(row, columnNames, columnValues)

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

    async updateByToken(externalUserId, row) {
        let columnValues = []
        const columnNames = []

        let sql = "UPDATE " + this.tableName + " SET "

        dbHelper.prepareUpdate(row, columnNames, columnValues)
        columnNames.push('ts=?')
        sql += columnNames.join(',')
        sql += " WHERE externalUserId = ?"
        columnValues.push(dateHelper.getTimeStamp())
        columnValues.push(externalUserId)

        try {
            const result = await super.executeSql(sql, columnValues)
            if (result.affectedRows > 0) {
                return await this.findById(row.externalUserId)
            }
            return undefined
        } catch (ex) {
            console.log(ex);
            throw ex
        }

    }

    async getAll_agent(personalSupportAgentId, search_value) {
        let sql = 'SELECT uid,prefix,fName,lName,email,phone,orgId,externalUserId,personalSupportAgentId,notes,comments,ts,veevaLink,roleId,udf1 FROM ' + this.tableName + ' WHERE udf2=1 AND personalSupportAgentId=? AND udf1 like ?;'
        try {
            const result = await super.executeSql(sql, [personalSupportAgentId, `%${search_value}%`])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async checkIfPersonalAgentAlreadyExists(userId) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE personalSupportAgentId != 0 AND externalUserId=?;'
        try {
            const result = await super.executeSql(sql, [userId])
            return result[0];
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

}
module.exports = UserHcpTable


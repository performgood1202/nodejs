const Model = require('../baseDbModel')
const dateHelper = require('../../Util/dateTime')
const dbHelper = require('./dbHelper')
const dbConstants = require('../dbConstants')

class ChatThreadTable extends Model {
    constructor(row, /* username */) {
        super('tChatThread')
        if (undefined !== row) {
            this.hcpId = row.hcpId
            this.orgId = row.orgId
            this.currentSupportAgentId = row.currentSupportAgentId
            this.fallbackSupportAgentId = row.fallbackSupportAgentId
            this.primarySupportAgentId = row.primarySupportAgentId
            this.createdDateTime = dateHelper.getDateTimeNowUtc("YYYY/MM/DD HH:mm:ss");
            this.updatedDateTime = dateHelper.getDateTimeNowUtc("YYYY/MM/DD HH:mm:ss");
            this.currentStatus = dbConstants.chatThreadStatus.inProgress;
            this.isArchived = 0
            this.notes = ''
            this.isClosed = 0
            this.comments = ''
            this.ts = dateHelper.getTimeStamp();
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

    async findByIds(uids) {
        let sql = `SELECT * FROM ${this.tableName} WHERE uid in ${uids};`
        try {
            const result = await super.executeSql(sql, [])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async getOpenThreadIfAny(hcpId, orgId) {
        let sql = `SELECT * FROM  ${this.tableName} where hcpId = ? and orgId = ?  and isClosed = 0;`
        try {
            const [result] = await super.executeSql(sql, [hcpId, orgId])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }


    async closeThread(uids) {
        let sql = `update  ${this.tableName} SET isClosed=1, currentStatus =? WHERE uid in ${uids};`
        try {
            const result = await super.executeSql(sql, [dbConstants.chatThreadStatus.resolved])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async getThreadsForEmployee(orgId, agentId) {
        let sql = `SELECT * FROM  ${this.tableName} where (currentSupportAgentId = ? or fallbackSupportAgentId =? or primarySupportAgentId =?) and orgId =  ?  and isClosed = 0;`
        try {
            const result = await super.executeSql(sql, [agentId, agentId, agentId, orgId])
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

        columnNames.push(`updatedDateTime= '${row.updatedDate || dateHelper.getDateTimeNowUtc("YYYY/MM/DD HH:mm:ss")}'`)
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
module.exports = ChatThreadTable

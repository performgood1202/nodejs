const Model = require('../baseDbModel')
const dateHelper = require('../../Util/dateTime')
const dbHelper = require('./dbHelper')
// const dbConstants = require('../dbConstants')

class ChatMessageTable extends Model {
    constructor(row, /* username */) {
        super('tChatMessage')
        if (undefined !== row) {


            this.threadId = row.threadId
            this.hcpId = row.hcpId
            this.agentId = row.agentId
            this.messageType = row.messageType
            this.messageDirectionType = row.messageDirectionType
            this.contentType = row.contentType || 0
            this.content = row.content
            this.attachmentUrl = row.attachmentUrl || ''
            this.createdAt = dateHelper.getDateTimeNowUtc("YYYY/MM/DD HH:mm:ss");
            this.isRead = 0
            this.udf1 = row.udf1 || 0
            this.udf2 = row.udf2 || ''
            this.iteration = row.iteration || 0
            this.ts = dateHelper.getTimeStamp()

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

    async updateIsRead(uids) {
        let sql = `update  ${this.tableName} SET isRead=1 WHERE uid in ${uids};`
        try {
            const result = await super.executeSql(sql, [])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async findBythreadId(threadId) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE threadId=?;'
        try {
            const result = await super.executeSql(sql, [threadId])
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
module.exports = ChatMessageTable

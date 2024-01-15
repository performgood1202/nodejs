const Model = require('../baseDbModel')
const dateHelper = require('../../Util/dateTime')
const dbHelper = require('./dbHelper')

class ScheduleTable extends Model {
    constructor(row, /* username */) {
        super('tSchedule')
        if (undefined !== row) {



            this.threadId = row.threadId
            this.iterationId = row.iterationId
            this.mettingInviteMessageId = row.mettingInviteMessageId
            this.meetingInviteReplyMessageId = row.meetingInviteReplyMessageId
            this.orgId = row.orgId
            this.hcpId = row.hcpId
            this.agentId = row.agentId
            this.startDateTime = row.startDateTime
            this.duration = row.duration
            if (row.endDateTime)
                this.endDateTime = row.endDateTime
            this.udf3 = row.udf3 || false;
            this.isCancelled = row.isCancelled
            this.ts = row.ts
            this.updatedDate = row.updatedDate


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

    async findByChatId(mettingInviteMessageId) {
        let sql = 'SELECT * FROM ' + this.tableName + ' WHERE mettingInviteMessageId=?;'
        try {
            const result = await super.executeSql(sql, [mettingInviteMessageId])
            return result[0];
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async getAgentsAllSchedule(agentId) {
        // let datetimenow = dateHelper.getDateTimeNowUtc("YYYY/MM/DD HH:mm:ss");
        let sql = `SELECT A.*,B.content FROM ${this.tableName} AS A INNER JOIN tChatMessage AS B ON B.uid=A.mettingInviteMessageId  WHERE A.agentId=${agentId};`
        try {
            const result = await super.executeSql(sql, [])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async getAgentsUpComingSchedule(agentId) {
        let datetimenow = dateHelper.getDateTimeNowUtc("YYYY/MM/DD HH:mm:ss");
        let sql = `SELECT * FROM ${this.tableName} WHERE agentId=${agentId} and startDateTime > '${datetimenow}';`
        try {
            const result = await super.executeSql(sql, [])
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
            return result[0];
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

}
module.exports = ScheduleTable
const Model = require('../baseDbModel')
// const dateHelper = require('../../Util/dateTime')
// const dbHelper = require('./dbHelper')
// const md5 = require('md5')
// const dbConstants = require('../dbConstants')
// const { callbackPromise } = require('nodemailer/lib/shared')

class notificationTemplateTable extends Model {
    constructor(row, /* adminName */) {
        super('tEmailNotificationTemplates');

        if (undefined !== row) {
            this.orgid = row.orgid;
            this.emailtype = row.emailtype;
            this.subject = row.subject;
            this.message = row.message;
            this.roleId = row.roleId;
        }
    }

    async templateModel(data) {
        console.log(data)
        try {
            //let sql = `SELECT * FROM tEmailNotificationTemplates WHERE emailtype=? AND roleId=?`;
            //const [result] = await super.executeSql(sql, [data.emailType, data.roleId]);
            let sql = `SELECT * FROM tEmailNotificationTemplates WHERE subject=?`;
            const [result] = await super.executeSql(sql, [data.emailType]);
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex;
        }
    }

    async getTemplate(roleId) {
        try {
            let sql = `SELECT meta_data as metaData,
            subject,
            message,
            case
                when action_type = 1 then 'organization_addition'
                when action_type = 2 then 'organization_deletion'
                when action_type = 3 then 'organization_edit'
                when action_type = 4 then 'user_creation'
                when action_type = 5 then 'user_edition'
                when action_type = 6 then 'user_deletion'
                when action_type = 7 then 'content_edit'
            end as 'emailtype',
            enc.*
        FROM tEmailNotificationTemplates as ent
            inner join tEmailNotificationConfig as enc on enc.template_id = ent.id
        where enc.action_by = ?`;
            const result = await super.executeSql(sql, [roleId]);
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex;
        }
    }

    async updateTemplate(data) {
        try {
            let sql = `UPDATE tEmailNotificationTemplates SET subject = ?, message=?
                WHERE id = ?`;
            const result = await super.executeSql(sql, [data.subject, data.message, data.id]);
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex;
        }
    }

    /*     
        async getAll_org(orgId) {
            let sql = 'SELECT uid,username,fName,lName,email,phone,orgId,roleId,notes,comments,ts,veevaLink FROM ' + this.tableName + ' where orgId=?;'
            try {
                const result = await super.executeSql(sql, [orgId])
                return result;
            } catch (ex) {
                throw ex
            }
        }
    
        async getAll_org_peers(orgId) {
            let sql = `SELECT * FROM ${this.tableName} where orgId=${orgId} and roleId != ${dbConstants.roles.orgAdmin};`
            try {
                const result = await super.executeSql(sql, [orgId])
                return result;
            } catch (ex) {
                throw ex
            }
        }
    
        async findById(uid) {
            let sql = 'SELECT uid,username,fName,lName,email,phone,orgId,roleId,notes,comments,ts,veevaLink FROM ' + this.tableName + ' WHERE uid=?;'
            try {
                const result = await super.executeSql(sql, [uid])
                return result[0];
            } catch (ex) {
                throw ex
            }
        }
    
        async findByUsername(username) {
            let sql = 'SELECT * FROM ' + this.tableName + ' WHERE username=?;'
            try {
                const result = await super.executeSql(sql, [username])
                return result[0];
            } catch (ex) {
                throw ex
            }
        }
    
        async update(username, uid, row) {
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
                throw ex
            }
    
        }
    
        async remove(uid) {
            let sql = 'delete  FROM ' + this.tableName + ' WHERE uid=?;'
            try {
                const result = await super.executeSql(sql, [uid])
                return dbHelper.getFirstRow(result);
            } catch (ex) {
                throw ex
            }
        }
    
        async removeByUserName(username) {
            let sql = 'delete  FROM ' + this.tableName + ' WHERE username=?;'
            try {
                const result = await super.executeSql(sql, [username])
                return dbHelper.getFirstRow(result);
            } catch (ex) {
                throw ex
            }
        } 
        */

}
module.exports = notificationTemplateTable;
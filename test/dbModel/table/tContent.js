const Model = require('../baseDbModel')
const dateHelper = require('../../Util/dateTime')
const dbHelper = require('./dbHelper')
// const md5 = require('md5')

class Content extends Model {
    constructor(row, /* adminName */) {
        super('tContent')
        if (undefined !== row) {
            this.media_type = row.media_type;
            this.file_name = row.file_name;
            this.media_location = row.media_location;
            this.pre_approved_text = row.pre_approved_text;
            this.text_heading = row.text_heading;
            this.orgid = row.orgid;
            this.roleid = row.roleid;
            this.userid = row.userid;
            this.is_s3_file = row.is_s3_file;
            this.timestamp = row.timestamp || new Date();
        }
    }

    async getAll() {
        let sql = 'SELECT media_type, file_name, media_location, pre_approved_text, text_heading, orgid, roleid, userid FROM ' + this.tableName + ';'
        try {
            const result = await super.executeSql(sql, [])
            return result;
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async getAll_org(orgId, search, media_type, limit = 10, offset = 0, orderBy = 'timestamp desc') {
        if (media_type == 1 && orderBy.includes('file_name')) {
            orderBy = orderBy.replace('file_name', 'text_heading');
        }
        let searchQuery = ``;
        let sql = `
            SELECT
                uid,
                media_type,
                file_name,
                media_location,
                pre_approved_text,
                text_heading,
                orgid,
                roleid,
                userid,
                is_s3_file,
                timestamp as updated_at
            FROM
                ${this.tableName}
            WHERE
                orgId = ?
                and media_type = ?`;
        if (search && media_type == 1) {
            searchQuery += ` and (text_heading like '%${search}%' or pre_approved_text like '%${search}%') `;
        } else if (search) {
            searchQuery += ` and file_name like '%${search}%' `;
        }
        sql += searchQuery;
        sql += ` order by ${orderBy}
            limit ${limit}
            offset ${offset}; `;

        const pagination = `select count(*) as total from ${this.tableName} WHERE orgId = ? and media_type = ? ${searchQuery}`;
        try {
            const content = await super.executeSql(sql, [orgId, media_type]);
            const paginationResult = await super.executeSql(pagination, [orgId, media_type]);
            let [pages, extra] = parseFloat(paginationResult[0].total / parseInt(limit, 0)).toFixed(1).split('.');
            console.log(paginationResult[0].total, extra);
            if (parseInt(extra) > 0) {
                pages = parseInt(pages) + 1;
            }
            return {
                pages: parseInt(pages),
                content
            };
        } catch (ex) {
            console.log(ex);
            throw ex
        }
    }

    async findById(uid) {
        let sql = 'SELECT media_type, file_name, media_location, pre_approved_text, text_heading, orgid, roleid, userid FROM ' + this.tableName + ' WHERE uid=?;'
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

        columnNames.push('timestamp=?')
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
module.exports = Content


const model = require("../baseDbModel.js");
const dbHelper = require('./dbHelper');
const dateTime = require("../../Util/dateTime.js");
const { getDateTimeNowUtc } = require("../../Util/dateTime.js");

class CommonQueries extends model {

    constructor() {
        super('tUserMaster')

    }




    async authenticate(username, password) {
        let q = `call sp_authenticate(?,?)`

        try {
            const result = await super.executeSql(q, [username, password]);
            return result && result[0] && result[0][0] ? result[0][0] : null;
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getUser(username) {
        let q = `call sp_getUser(?)`

        try {
            const result = await super.executeSql(q, [username]);
            return result && result[0] && result[0][0] ? result[0][0] : null;
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getOrg(ordIg) {
        let q = `call sp_getOrganization(?)`

        try {
            const result = await super.executeSql(q, [ordIg]);
            return result && result[0] && result[0][0] ? result[0][0] : null;
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getAllRoles() {
        let q = `select * from tRoleType`

        try {
            const result = await super.executeSql(q, []);
            return result ? result : null;
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }


    async addSession(username, token) {
        let q = `call sp_addSession(?,?)`

        try {
            const result = await super.executeSql(q, [username, token]);
            return result && result.affectedRows && result.affectedRows == 1;
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getUserSession(token) {
        let q = `call sp_getUserDetailsFromToken(?)`

        try {
            return await dbHelper.executeAndGetFirstRow(this, q, [token]);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async removeUserSessions(username) {
        let q = `call sp_removeAllSessions(?)`

        try {
            const result = await super.executeSql(q, [username]);
            return dbHelper.isRowAffected(result);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }


    async invalidateUserSession(token) {
        let q = `call sp_removeUserSession(?)`

        try {
            const result = await super.executeSql(q, [token]);
            return dbHelper.isRowAffected(result);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getUserForPasswordReset(username, email, dob) {
        let q = `call sp_getUserForPasswordReset(?,?,?)`

        try {
            const result = await super.executeSql(q, [username, email, dob]);
            return dbHelper.getFirstRow(result);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async setUserPassword(username, password) {
        let q = `call sp_setUserPassword(?,?)`

        try {
            const result = await super.executeSql(q, [username, password]);
            return dbHelper.isRowAffected(result);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }


    async updateUserPassword(username, ex_password, new_password) {
        let q = `call sp_updatePassword(?,?,?)`

        try {
            return await dbHelper.executeAndCheckRowAffected(this, q, [username, ex_password, new_password]);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async checkIfUserAlreadyExists(username) {
        let q = `call sp_checkIfUserNameExists(?)`

        try {
            return await dbHelper.executeAndGetFirstRow(this, q, [username]);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async checkIfExternalUserIdAlreadyExists(externalUserId) {
        let q = `call sp_checkIfExternalUserIdAlreadyExists(?)`

        try {
            return await dbHelper.executeAndGetFirstRow(this, q, [externalUserId]);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getAllHangingThreads() {
        let q = `call sp_getAllHangingThreads()`

        try {
            return await dbHelper.executeAndGetRows(this, q);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getAllNoReplyThreads() {
        let q = `call sp_getAllNoReplyThreads()`

        try {
            return await dbHelper.executeAndGetRows(this, q);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async addLogs(str_username, a_type, s_req, s_res, s_token, s_trace) {
        if (s_req) {
            s_req = JSON.stringify(s_req);

        }
        if (s_res) {
            s_res = JSON.stringify(s_res);

        }
        let q = `call sp_addLogs(?,?,?,?,?,?,?,?)`

        try {
            return null;
	    /* 
            await dbHelper.executeAndCheckRowAffected(this, q, [
                str_username,
                a_type,
                s_req || '',
                s_res || '',
                s_token || '',
                s_trace || 'empty',
                getDateTimeNowUtc(),
                dateTime.getTimeStamp()
            ]);
	     */
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getDashboardDetails(agentId, from, to) {
        let q = `call sp_getDashboardDetails(?,?,?)`

        try {
            const result = await super.executeSql(q, [agentId, from, to]);
            return result ? result : null;
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async setUserToken(username, token) {
        let q = `call sp_setUserToken(?,?)`

        try {
            const result = await super.executeSql(q, [username, token]);
            return dbHelper.isRowAffected(result);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }

    async getUserForResetPassword(token) {
        let q = `call sp_getUserForResetPassword(?)`

        try {
            const result = await super.executeSql(q, [token]);
            return dbHelper.getFirstRow(result);
        }
        catch (ex) {
            console.log(ex);
            throw (ex)
        }
    }
}

module.exports = CommonQueries;

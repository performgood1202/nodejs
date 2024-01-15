const roles = {
    superAdmin: 1,
    orgAdmin: 2,
    SalesRep: 3,
    MSL: 4,
    HCP: 5
}

const actions = {
    organization_addition: 1,
    organization_deletion: 2,
    organization_edit: 3,
    user_creation: 4,
    user_edition: 5,
    user_deletion: 6,
    content_edit: 7,
}

const externalApiType = {
    line_org: 1,
    veeva_org: 2,
    line_user: 3,
    veeva_user: 4,
}

const chatThreadStatus = {
    unread: 1,
    inProgress: 2,
    inTransfer: 3,
    resolved: 4,
    rejected: 5,
    rejectDueToAbusiveLanguage: 6

}

const mettingStatusType = {
    waitingHcpAcceptance: 1,
    confirmed: 2,
    completed: 3,
    hcpCancelled: 4,
    agentCancelled: 5,
    inProgress: 6,
}
const messageType = {
    text: 1,
    audio: 2,
    video: 3,
    image: 4,
    audioLink: 5,
    meetingInvite: 6,
    preApprovedText: 7,
    emoji: 8,
    system: 9,
    ignore: 10,
    document: 11,
    transfer: 12,
    transferAccepted: 13,
    transferRejected: 14,
    assignBackThreadDueToHanging: 15,
    autoCloseThreadDueToNoReply: 16,
    youtubeLink: 17,
    meetingInviteAccepted: 18,
    meetingInviteReject: 19
}

const MessageDirection = {
    system: 1,
    notification: 2,
    incoming: 3,
    outgoing: 4,
}

const logTypes = {
    login: 1,
    forgotPassword: 2,
    logout: 3,
    register: 4,


    //org:
    getAllOrg: 5,


    //user:
    getAllUser: 9,
    addUser: 10,
    updateUser: 11,
    deleteUser: 12,

    //hcp:
    getAllHcp: 15,
    addHcp: 16,
    updateHcp: 17,
    deleteHcp: 18,


    //chat:
    connectWebHook: 20,
    connect_getMy: 21,
    connect_getChatMessages: 22,
    connect_sendMessageToHcp: 23,
    connect_getMyOpenThreads: 24,
    connect_updateChatReadStatus: 25,
    connect_getTransferAblePeers: 21,
    connect_transfer: 22,
    connect_acceptTransfer: 23,
    connect_rejectTransfer: 24,
    connect_getUpComingSchedule: 25,
}


module.exports = {
    roles, logTypes, externalApiType, mettingStatusType, messageType, MessageDirection, chatThreadStatus, actions,
};

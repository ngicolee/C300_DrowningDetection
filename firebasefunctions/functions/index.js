const functions = require(
    "firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config()
    .firebase);
let msgData;
exports.offerTrigger = functions
    .firestore.document(
        "drowning/{drowningId}"
    ).onCreate((snapshot, context) => {
        msgData = snapshot.data();
        admin.firestore()
            .collection("tokens")
            .get().then((
                snapshots) => {
                let tokens = [];
                if (snapshots
                    .empty) {
                    console.log(
                        "No Devices Found"
                    );
                } else {
                    for (let pushTokens of
                        snapshots
                            .docs) {
                        tokens
                            .push(
                                pushTokens
                                    .data()
                                    .token
                            );
                    }
                    let payload = {
                        "notification": {
                            "title": "From " +
                                msgData
                                    .orgType,
                            "body": msgData
                                .drowningText,
                            "sound": "default",
                        },
                        "data": {
                            "sendername": msgData
                                .orgType,
                            "message": msgData
                                .drowningText,
                        },
                    };
                    return admin
                        .messaging()
                        .sendToDevice(
                            tokens,
                            payload
                        )
                        .then((
                            response) => {
                            console
                                .log(
                                    "Pushed them all"
                                );
                        })
                        .catch((
                            err) => {
                            console
                                .log(
                                    err
                                );
                        });
                }
            });
    });
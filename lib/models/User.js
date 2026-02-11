const userSchema = new mongoose.Schema({
    email: String,
    password: String,
    role: {
        type: String,
        default: "user"
    },

    balance: {
        type: Number,
        default: 0
    },

    orderLimit: {
        type: Number,
        default: 0
    }
});
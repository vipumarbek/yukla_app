const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// MongoDB ulanish
mongoose.connect('mongodb://127.0.0.1:27017/yukla_db')
    .then(() => console.log('MongoDB ulandi'))
    .catch(err => console.log(err));

// ================= USER SCHEMA =================
const userSchema = new mongoose.Schema({
    name: String,
    email: String,
    role: {
        type: String,
        default: "user"
    }
});

const User = mongoose.model('User', userSchema);

// ================= GOOGLE LOGIN =================
app.post('/google-login', async(req, res) => {

    const { name, email } = req.body;

    if (!email) {
        return res.status(400).json({ message: "Email topilmadi" });
    }

    // User bazada bormi?
    let user = await User.findOne({ email });

    // Agar yo‘q bo‘lsa yangi yaratamiz
    if (!user) {

        let role = "user";

        // 🔥 Admin ajratish
        if (email === "vipumarbek@gmail.com") {
            role = "admin";
        }

        user = new User({
            name,
            email,
            role
        });

        await user.save();
    }

    res.json({
        message: "Success",
        role: user.role
    });
});

// ================= GET USERS (Admin uchun) =================
app.get('/users', async(req, res) => {
    const users = await User.find();
    res.json(users);
});

app.listen(5000, () => {
    console.log('Server 5000-portda ishga tushdi');
});
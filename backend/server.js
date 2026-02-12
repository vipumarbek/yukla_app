const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

mongoose.connect('mongodb://127.0.0.1:27017/yukla_db')
    .then(() => console.log('MongoDB ulandi'))
    .catch(err => console.log(err));

/* ================= USER SCHEMA ================= */

const userSchema = new mongoose.Schema({
    name: String,
    phone: String,
    password: String,
});

const User = mongoose.model('User', userSchema);

/* ================= ORDER SCHEMA ================= */

const orderSchema = new mongoose.Schema({
    truck: String,
    from: String,
    to: String,
    date: String,
    time: String,
});

const Order = mongoose.model('Order', orderSchema);

/* ================= REGISTER ================= */

app.post('/register', async(req, res) => {
    try {
        const { name, phone, password } = req.body;

        const existingUser = await User.findOne({ phone });
        if (existingUser) {
            return res.status(400).json({ message: "Bu raqam allaqachon mavjud" });
        }

        const user = new User({ name, phone, password });
        await user.save();

        res.status(201).json({ message: "Ro‘yxatdan o‘tildi" });

    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

/* ================= LOGIN ================= */

app.post('/login', async(req, res) => {
    try {
        const { phone, password } = req.body;

        const user = await User.findOne({ phone, password });

        if (!user) {
            return res.status(400).json({ message: "Login xato" });
        }

        res.json({
            message: "Muvaffaqiyatli login",
            user: user
        });

    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

/* ================= CREATE ORDER ================= */

app.post('/orders', async(req, res) => {
    try {
        const order = new Order(req.body);
        await order.save();
        res.status(201).json(order);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

/* ================= START SERVER ================= */

app.listen(5000, () => {
    console.log('Server 5000-portda ishga tushdi');
});
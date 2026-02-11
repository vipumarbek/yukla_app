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

// Order schema
const orderSchema = new mongoose.Schema({
    name: String,
    phone: String,
    product: String,
});

const Order = mongoose.model('Order', orderSchema);

// TEST
app.get('/test', (req, res) => {
    res.json({ message: 'Backend ishlayapti' });
});

// GET orders
app.get('/orders', async(req, res) => {
    const orders = await Order.find();
    res.json(orders);
});

// POST order
app.post('/orders', async(req, res) => {
    try {
        const newOrder = new Order(req.body);
        await newOrder.save();
        res.status(201).json(newOrder);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.listen(5000, () => {
    console.log('Server 5000-portda ishga tushdi');
});
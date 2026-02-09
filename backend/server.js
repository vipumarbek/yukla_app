const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const app = express();
const PORT = 5000;

/* ===== MIDDLEWARE ===== */
app.use(cors());
app.use(express.json());

/* ===== MONGODB ===== */
mongoose
    .connect(
        "mongodb+srv://vipumarbek:yukla12345@cluster0.a9reup8.mongodb.net/yukla", {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        }
    )
    .then(() => console.log("MongoDB ulandi ✅"))
    .catch((err) => console.log("Mongo error:", err.message));

/* ===== MODEL ===== */
const OrderSchema = new mongoose.Schema({
    title: { type: String, required: true },
    price: { type: Number, required: true },
}, { timestamps: true });

const Order = mongoose.model("Order", OrderSchema);

/* ===== ROUTES ===== */

// test
app.get("/", (req, res) => {
    res.send("Backend OK");
});

// CREATE order
app.post("/order", async(req, res) => {
    try {
        const order = new Order(req.body);
        await order.save();
        console.log("ORDER SAQLANDI:", req.body);
        res.json({ success: true });
    } catch (e) {
        res.status(500).json({ success: false, error: e.message });
    }
});

// READ orders
app.get("/orders", async(req, res) => {
    const orders = await Order.find().sort({ createdAt: -1 });
    res.json(orders);
});

// UPDATE order
app.put("/order/:id", async(req, res) => {
    const updated = await Order.findByIdAndUpdate(
        req.params.id,
        req.body, { new: true }
    );
    res.json(updated);
});

// DELETE order
app.delete("/order/:id", async(req, res) => {
    await Order.findByIdAndDelete(req.params.id);
    res.json({ success: true });
});

/* ===== START ===== */
app.listen(PORT, () => {
    console.log(`Server ${PORT}-portda ishga tushdi`);
});
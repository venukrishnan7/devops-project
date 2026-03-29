const express = require('express');
const app = express();
const PORT = process.env.PORT || 3001;

app.get('/users', (req, res) => {
    res.json({ 
        service: 'User Service', 
        status: 'Healthy',
        users: [{ id: 1, name: 'Alice' }, { id: 2, name: 'Bob' }] 
    });
});

app.listen(PORT, () => {
    console.log(`User service running on port ${PORT}`);
});
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3002;

app.get('/tasks', (req, res) => {
    res.json({ 
        service: 'Task Service', 
        status: 'Healthy',
        tasks: [{ id: 101, title: 'Setup CI/CD' }, { id: 102, title: 'Learn Kubernetes' }] 
    });
});

app.listen(PORT, () => {
    console.log(`Task service running on port ${PORT}`);
});
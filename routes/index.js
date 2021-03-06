var express = require('express');
var router = express.Router();
var connection = require('../common/model.js').connection;

/* GET home page. */
router.get('/', function(req, res, next) {
    var where = '';
    var param = '';
    if (req.query.tid) {
        where = ' where tid=' + req.query.tid;
        param = '&tid=' + req.query.tid;
    }
    connection.query('select count(*) as total from articles' + where, function(error, results) {
        if (error) {
            console.log('查询失败', error);
        } else {
            var page = {};
            page.every = 5;
            page.total = results[0].total;
            page.pages = Math.ceil(page.total / page.every);
            page.now = req.query.p ? Number(req.query.p) : 1;
            page.prev = page.now - 1 < 1 ? 1 : page.now - 1;
            page.next = page.now + 1 > page.pages ? page.pages : page.now + 1;

            connection.query('select * from articles ' + where + ' limit ' + (page.now - 1) * page.every + ',' + page.every + '', function(error, results) {
                if (error) {
                    console.log('查询失败', error);
                } else {
                    connection.query('select * from types', function(err, results1) {
                        if (err) {
                            console.log('查询失败', error);
                        } else {
                            res.render('index', { results: results, moment: require('moment'), results1: results1, page: page, param: param });
                        }
                    })
                }
            })
        }
    })
});
router.get('/show/:id', function(req, res) {
    connection.query('select * from articles where id=' + req.params.id, function(error, results) {
        if (error) {
            console.log('查询失败', error);
        } else {
            var moment = require('moment');
            res.render('show', { results: results[0], moment: moment });
        }
    })
})
//用户注册
router.get('/reg', function(req, res, next) {
    res.render('reg');
});
router.post('/reg', function(req, res, next) {
    if (Number(req.body.code) === req.session.code) {
        req.body.password = require('../common/common.js').md5(req.body.password);
        req.body.addtime = Math.floor(new Date().getTime() / 1000);
        connection.query('insert into users(username,password,phone,addtime) values("' + req.body.username + '","' + req.body.password + '","' + req.body.phone + '",' + req.body.addtime + ')', function(error) {
            if (error) {
                console.log('添加失败', error);
            } else {
                res.redirect('/login');
            }
        })
    } else {
        res.redirect('/reg');
    }
});
router.post('/check', function(req, res) {
    connection.query('select * from users where username="' + req.body.username + '"', function(error, results) {
        if (error) {
            console.log('查询失败', error);
        } else {
            if (results.length === 1) {
                res.json({ success: 1, more: ['xxx123', '123xxx', '1xxx1'] });
            } else {
                res.json({ success: 0 });
            }
        }
    })
});

router.post('/msg', function(req, res) {
    function rand(m, n) {
        return Math.floor(Math.random() * (n - m + 1) + m);
    }

    var code = rand(1000, 9999);
    console.log(code);
    req.session.code = code;

    TopClient = require('../common/alidayu/topClient.js').TopClient;
    var client = new TopClient({    
        'appkey': '23341634',
            'appsecret': '7e30a1c2c254c9a109f283067e8d5e18',
            'REST_URL': 'http://gw.api.taobao.com/router/rest'
    });
    client.execute('alibaba.aliqin.fc.sms.num.send', {    
        'extend': '123456',
            'sms_type': 'normal',
        // 签名：本网站的标识符，不能改变
            'sms_free_sign_name': '俊哥技术小站',
        // 短信模板中的code参数
            'sms_param': '{\"code\":\"' + code + '\"}',
            'rec_num': req.body.phone,
        // 短信模板的编号
            'sms_template_code': 'SMS_105890028'
    }, function(error, response) {    
        if (error) {
            console.log('发送失败', error);
            res.json({ success: 0 });
        } else {
            // console.log('发送成功');
            res.json({ success: 1 });
        }
    })

})
router.get('/login', function(req, res) {
    res.render('login', { error: req.flash('error').toString() });
});

router.post('/login', function(req, res) {
    req.body.password = require('../common/common.js').md5(req.body.password);
    connection.query('select * from users where username="' + req.body.username + '" and password="' + req.body.password + '"', function(error, results) {
        if (error) {
            console.log('查询信息失败', error);
        } else {
            if (results.length === 0) {
                req.flash('error', '用户名和密码匹配错误');
                res.redirect('back');
            } else {

                req.session.admin = results[0];
                res.redirect('/users');
            }
        }
    })
});

//退出
router.get('/logout', function(req, res) {
    req.session.admin = null;
    res.redirect('/login');
})
var multer = require('multer');
var upload = multer({
    dest: 'public/upload/articles'
})

// 专门处理文章文件上传
router.post('/upload', upload.single('editormd-image-file'), function(req, res) {
    var fs = require('fs');
    var path = require('path');

    var oldname = path.join('public/upload/articles', req.file.filename);
    var filename = req.file.filename + path.extname(req.file.originalname);
    var newname = path.join('public/upload/articles', filename);

    fs.rename(oldname, newname, function(error) {
        if (error) {
            res.json({ success: 0, message: '上传失败', url: '' });
        } else {
            var newpath = path.join('/upload/articles', filename);
            res.json({ success: 1, message: '上传成功', url: newpath })
        }
    })
})
//搜索框
router.post('/aselect', function(req, res) {
    connection.query('select * from articles where title like "%' + req.body.search + '%"', function(error, results) {
        if (error) {
            console.log('查询失败', results);
            console.log('查询标题失败');
        } else {
            console.log('数据', results);
            if (results == '') {
                console.log('空字符串');
                res.json({ success: 0 });
            } else {
                res.json({ success: 1, results: results });
            }
        }
    });
})
//点赞
// router.get('/azan/:id', function(req, res) {
//     connection.query('update articles set zan=zan+1 where id=' + req.params.id, function(error, results1) {
//         if (error) {
//             console.log('修改失败', results1[0]);
//         } else {
//             console.log('修改成功', results1[0]);
//             res.redirect('/', { results1: results1[0] });
//         }
//     })
// });
module.exports = router;
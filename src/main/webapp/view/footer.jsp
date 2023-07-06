
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style media="screen">
      *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body{
    background: #fcfcfc;
    font-family: sans-serif;
}
footer{
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background: #5C469C;
    height: auto;
    width: 100vw;

    padding-top: 15px;
    color: #fff;
}
.footer-content{
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    text-align: center;
}
.footer-content h3{
    font-size: 1.5rem;
    font-weight: 400;
    text-transform: capitalize;
    line-height: 3rem;
}
.footer-content p{
    max-width: 300px;
    margin: 10px auto;
    line-height: 28px;
    font-size: 14px;
    color: #cacdd2;
}

.footer-bottom{
    background: #5C469C;
    width: 100vw;
    padding-right: 20px;
    padding-left: 20px;
	padding-bottom: 40px;
    text-align: center;
}
.footer-bottom p{
float: left;
    font-size: 14px;
    word-spacing: 2px;
    text-transform: capitalize;
}
.footer-bottom p a{
  color:#FFFFFF;
  font-size: 16px;
  text-decoration: none;
}
.footer-bottom span{
    text-transform: uppercase;
    opacity: .4;
    font-weight: 200;
}
.footer-bottom a:hover{
  color: #D4ADFC;
}

.footer-menu{
  float: right;

}
.footer-menu ul{
  display: flex;
}
.footer-menu ul li{
padding-right: 10px;
display: block;
}
.footer-menu ul li a{
  color: #FFFFFF;
  text-decoration: none;
}

@media (max-width:500px) {
.footer-menu ul{
  display: flex;
  margin-top: 10px;
  margin-bottom: 20px;
}
}
    </style>
</head>
<body>
    <footer>
        <div class="footer-bottom">
            <p>23.07.06 ~ 23.07.10 &copy; <a href="/Team.jsp">Team Grow</a>
            <img class="btn" src="/repo/github.svg" onClick="window.open('https://github.com/yumalg12/Grow_InstantResume')" style="
    filter: invert(1);
    width: 19px;
    padding: 0;
    margin-top: -3px;
"></p>
                    <div class="footer-menu">
                      <ul class="f-menu">
                        <li><a href="/">Home</a></li>
                        <li><a href="/About.jsp">About</a></li>
                        <li><a href="/Reference.jsp">Reference</a></li>
                      </ul>
                    </div>
        </div>

    </footer>
</body>
</html>
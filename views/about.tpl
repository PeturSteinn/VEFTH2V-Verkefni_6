<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Um #síða</title>
  <link rel="stylesheet" href="../static/css/master.css">
  <link rel="stylesheet" href="../static/css/normalize.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
  <div class="nav-bar">
    <div class="selection">
      <label for="toggle"></label>
      <input class="menu-input" type="checkbox" id="toggle">
      <div class="menu-slide-in">
        <ul>
          <li><a href="/">&nbsp;&nbsp;Forsíða&nbsp;&nbsp;</a></li>
          <li><a href="/stodvar">&nbsp;&nbsp;Bensínstöðvar&nbsp;&nbsp;</a></li>
          <li><a href="#">&nbsp;&nbsp;Um #síða&nbsp;&nbsp;</a></li>
        </ul>
      </div>
    </div>
    <div class="search">
      <span>Leita&nbsp;&nbsp;|&nbsp;&nbsp;</span>
      <div class="box">
        <div class="container-4">
          <input type="search" id="search" placeholder="Olís, N1, Orkan..." />
          <button class="icon"><i class="fa fa-search"></i></button>
        </div>
      </div>
    </div>
    <div class="about">
      <a href="/about">About</a>
    </div>
  </div>
  <section class="wrapper">
    <div class="intro">
      <p>About</p>
    </div>
  </section>
  <footer>
    <section class="footer-content">
      © Pétur Steinn Guðmundsson
    </section>
  </footer>
</body>

</html>

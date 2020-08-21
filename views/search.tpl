<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <title>Um #síða</title>
  <link rel="stylesheet" href="/static/css/master.css">
  <link rel="stylesheet" href="/static/css/normalize.css">
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
          <form class="" action="/search">
          <input type="search" name="q" id="search" placeholder="Olís, N1, Orkan..." />
          <button class="icon"><i class="fa fa-search"></i></button>
        </form>
        </div>
      </div>
    </div>
    <div class="about">
      <a href="/about">About</a>
    </div>
  </div>
  <section class="wrapper fill">
    <div class="intro">
      <p>Leita</p>
    </div>
    <section class="search-result">
      % if len(results) != 0:
      <div class="stodvar-block">
        <div class="logo">
          <img src="/static/img/{{results[0]['key'][:2]}}.svg">
        </div>
        <a href="/stod/{{results[0]['company']}}">
            Nánar um {{results[0]['company']}}
        </a>
      </div>
      % else:
      <div class="no-results">
        <h3>Leitarorð: {{search_request}}</h3>
        Engar niðurstöður...</div>
      % end
    </section>
  </section>
  <footer>
    <section class="footer-content">
      <div class=""></div>
      <div class="github">
        <a href="https://github.com/PeturSteinn/VEFTH2V-Verkefni_6">
          <div class=""><img src="/static/img/github.svg" alt=""></div>
          <div class="">GitHub</div>
        </a>
      </div>
      <div class="signature">
        <p>© Pétur Steinn Guðmundsson</p>
      </div>
    </section>
  </footer>
</body>

</html>

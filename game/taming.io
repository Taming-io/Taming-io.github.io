<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Hub - Angry Birds</title>
    <meta name="description" content="Play Angry Birds on Game Hub! Enjoy this exciting game and explore more.">
    <link rel="stylesheet" href="../gamepage.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<style>
    /* Responsive Design */
    @media (max-width: 768px) {
        header {
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 5px 10px; /* Adjust padding for compact design */
            background-color: #000; /* Keep background consistent */
            height: 50px; /* Consistent header height */
        }

        .hamburger-menu {
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 20;
        }

        .hamburger-icon {
            font-size: 24px;
            color: #00FFFF;
            cursor: pointer;
        }

        .logo {
            flex: 1; /* Allow logo to take available space */
            text-align: center;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo img {
            height: 50px; /* Adjust size for logo */
            object-fit: contain; /* Ensure logo fits within space */
        }

        .controls {
            display: flex;
            justify-content: flex-end; /* Align controls to the right */
            align-items: center;
            gap: 10px; /* Space between search and moon icons */
        }

        #search-icon,
        #dark-mode-toggle {
            font-size: 20px;
            color: #00FFFF;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        /* Search Overlay */
        #search-section {
            display: none; /* Initially hidden */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.95); /* Semi-transparent black */
            z-index: 1000;
            overflow-y: auto; /* Allow scrolling */
        }

        .search-header {
            display: flex;
            justify-content: center; /* Align items horizontally */
            align-items: center;
            padding: 10px 20px;
            position: relative;
        }

        #overlay-search-bar {
            width: 90%; /* Full width on mobile */
            padding: 8px 12px; /* Adjust padding */
            font-size: 16px; /* Adjust font size */
            border: 2px solid #00FFFF; /* Cyan border */
            border-radius: 20px; /* Rounded corners */
            outline: none;
            background-color: #2a2a3b;
            color: #fff;
            box-sizing: border-box; /* Include padding in width */
            padding-right: 40px; /* Space for close button */
            position: relative;
        }

        #close-search-overlay {
            position: absolute;
            top: 50%;
            right: 15px; /* Position inside the search bar */
            transform: translateY(-50%);
            background-color: transparent;
            border: none;
            color: #00FFFF;
            font-size: 18px; /* Adjust font size */
            cursor: pointer;
            padding: 0;
            z-index: 1100;
        }

        #close-search-overlay:hover {
            color: #ff00ff; /* Change color on hover */
            transform: translateY(-50%) scale(1.2); /* Slight hover effect */
        }

        /* Game Cards Grid */
        .search-results-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr)); /* Responsive grid */
            gap: 15px; /* Space between items */
            width: 100%; /* Full width */
            padding: 10px; /* Add padding */
            box-sizing: border-box;
        }

        .search-results-grid .game-card {
            position: relative;
            background: #27293d;
            color: #fff;
            text-align: center;
            border-radius: 8px;
            overflow: hidden;
            width: 100%; /* Full width for grid */
            aspect-ratio: 1; /* Maintain square ratio */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            cursor: pointer;
        }

        .search-results-grid .game-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .search-results-grid .game-card .game-title {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
            padding: 10px;
            font-size: 14px;
            color: #00FFFF; /* Cyan text */
            text-transform: uppercase;
            font-weight: bold;
        }
    }
</style>
</head>
<body>
  <header>
    <div class="hamburger-menu" id="hamburger-menu">
        <div class="hamburger-icon" onclick="toggleMenu()">☰</div>
    </div>
    <div class="logo">
        <a href="../index.html">
            <img src="../images/Taming io Game Logo.png" alt="Game Hub Logo">
        </a>
    </div>
    <nav>
       <ul class="nav-links">
            <li><a href="Category/action/Index.html">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="contact.html">Contact</a></li>
        </ul>
    </nav>
  <div class="controls">
  <i id="search-icon" class="fas fa-search" onclick="openSearchSection()"></i>
      
 <div id="search-section" class="search-overlay">
    <div class="search-header">
        <input
            type="text"
            id="overlay-search-bar"
            placeholder="Search a game to play..."
            oninput="filterGamesOverlay()"
        />
        <button id="close-search-overlay" onclick="closeSearchSection()">✖</button>
    </div>
    <h2>Games</h2>
    <div class="search-results-grid" id="search-results-grid"></div>
</div>




    <button id="dark-mode-toggle">🌙</button>
</div>

</header>
       <section class="scrolling-games">
    <div class="scrolling-container">
        <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
       <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
         <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
         <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
         <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
         <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
         <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
         <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
         <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
         <a class="scrolling-game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
       
        <!-- Add more game cards as needed -->
    </div>
</section>

<!-- Sliding Menu -->
<div class="mobile-menu" id="mobile-menu">
    <div class="menu-header">
        <button class="close-menu" onclick="toggleMenu()">✖</button>
    </div>
    <ul class="mobile-menu-links">
        <li><button class="filter-btn" data-category="all" onclick="toggleMenu()">All Games</button></li>
        <li><button class="filter-btn" data-category="action" onclick="toggleMenu()">Action</button></li>
        <li><button class="filter-btn" data-category="puzzle" onclick="toggleMenu()">Puzzle</button></li>
        <li><button class="filter-btn" data-category="sports" onclick="toggleMenu()">Sports</button></li>
    </ul>
    <div class="mobile-menu-socials">
        <a href="https://facebook.com" target="_blank" title="Facebook"><i class="fab fa-facebook"></i></a>
        <a href="https://twitter.com" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
        <a href="https://instagram.com" target="_blank" title="Instagram"><i class="fab fa-instagram"></i></a>
    </div>
</div>

    
    <main>
           <section class="game-section">
      <!-- Left Game Cards -->
<div class="left-section">
    <div class="leftright-grid">
       <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
       <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
       <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
        <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
    </div>
    <div class="ad-container">
        <img src="../images/War Robots Battle Mech Arena-512x384.jpg" alt="Ad" class="ad-image">
    </div>
    <div class="leftright-grid">
    <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
    <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
        </div>
      <div class="ad-container">
        <img src="../images/War Robots Battle Mech Arena-512x384.jpg" alt="Ad" class="ad-image">
    </div>
     <div class="leftright-grid">
    <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
    <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
        </div>
</div>

        <!-- Main Game Iframe -->
      
 <div class="game-content">
    <div class="iframe-container">
        <iframe src="https://www.crazygames.com/embed/taming-io"
                title="Taming.io" allowfullscreen></iframe>
    </div>

    <div class="game-info-container">
        <div class="game-title">Angry Birds</div>
        <div class="game-buttons">
            <i class="fas fa-share-alt share-icon" onclick="shareGame()" title="Share"></i>
            <i class="fas fa-expand fullscreen-icon" onclick="makeFullscreen()" title="Full Screen"></i>
        </div>
    </div>

    <div class="game-description">
        <h3>Description</h3>
        <p>Angry Birds is a fun and addictive game where you catapult birds to destroy enemy structures. Use your skill and strategy to complete each level!</p>
        <h3>Instructions</h3>
        <p>Use the mouse or touch controls to aim and launch the birds. Each bird has unique abilities, so plan your moves carefully!</p>
    </div>
</div>

       <!-- Right Game Cards -->
<div class="right-section">
      <div class="leftright-grid">
       <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
       <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
        
       <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
        
         <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
    </div>
    <div class="ad-container">
        <img src="../images/War Robots Battle Mech Arena-512x384.jpg" alt="Ad" class="ad-image">
    </div>
    <div class="leftright-grid">
    <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
    <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
        </div>
    <div class="ad-container">
        <img src="../images/War Robots Battle Mech Arena-512x384.jpg" alt="Ad" class="ad-image">
    </div>
    <div class="leftright-grid">
    <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
    <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
        </div>
</div>
    </section>


        <h2>Other Games</h2>
        <div class="game-grid" id="game-grid">
            <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
             <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
             <a class="game-card" href="candy-crush.html" data-category="puzzle">
                <img src="../images/candy-crush-thumbnail.jpg" alt="Candy Crush">
                <div class="game-title">Candy Crush</div>
            </a>
           
      </div>
    </main>

    <footer>
        <p>&copy; 2025 Game Hub. All rights reserved.</p>
    </footer>

    <script src="../script.js"></script>
</body>
</html>

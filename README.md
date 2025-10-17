# Xojo Wordle

<p align="center">
  <img src="docs/images/WordleIcon.png" alt="Wordle Icon" width="100" height="100">
</p>

A feature-rich Wordle game implementation built with [Xojo](https://www.xojo.com/) Web framework and TypeScript, offering both single-player and multiplayer gameplay experiences.

> 🎯 **Try to guess the word in 6 attempts!** Each guess must be a valid word. The color of the tiles will change to show how close your guess was to the word.

## Screenshots

*Screenshots will be added once the application is running. The game features:*

- **Welcome Page**: Clean interface with game mode selection
- **Tutorial Dialog**: Interactive tutorial explaining game rules  
- **Single Player Game**: Grid-based word guessing interface with virtual keyboard
- **Multiplayer Lobby**: Room creation and joining interface
- **Game Grid**: 6x5 letter grid with color-coded feedback
- **Virtual Keyboard**: Interactive on-screen keyboard with letter status

## Features

- 🎯 **Single Player Mode**: Classic Wordle gameplay with word guessing mechanics
- 👥 **Multiplayer Mode**: Play with friends in real-time multiplayer sessions
- 🎨 **Interactive UI**: Clean web-based interface with visual feedback
- ⌨️ **Keyboard Support**: Full keyboard input support for seamless gameplay
- 📱 **Web-Based**: Cross-platform compatibility through web deployment
- 🎭 **Visual Feedback**: Color-coded tiles to indicate letter accuracy
- 📚 **Word Dictionary**: Built-in word validation and dictionary system

## Technology Stack

- **Backend**: Xojo Web Framework
- **Frontend**: TypeScript/JavaScript with jQuery
- **UI Components**: Custom Xojo web controls and containers
- **Build System**: Xojo IDE with TypeScript compilation

## Installation & Quick Start

### Quick Setup (Recommended)

1. **Clone and setup**:
   ```bash
   git clone https://github.com/piradoiv/xojo-wordle.git
   cd xojo-wordle
   cd src/js/typescript && npm install && tsc && cd ../../..
   ```

2. **Open in Xojo**:
   - Launch Xojo IDE (2023.04 or later required)
   - Open `src/xojo/Wordle.xojo_project`
   - Click "Run" to start development server
   - Visit `http://localhost:8080` in your browser

### Manual Setup

If you prefer to set up step by step:

**Prerequisites:**
- [Xojo](https://www.xojo.com/) (2023.04 or later)
- [Node.js](https://nodejs.org/) (for TypeScript compilation)
- TypeScript compiler (`npm install -g typescript`)

**Steps:**

1. **Clone the repository**:
   ```bash
   git clone https://github.com/piradoiv/xojo-wordle.git
   cd xojo-wordle
   ```

2. **Set up TypeScript dependencies**:
   ```bash
   cd src/js/typescript
   npm install
   ```

3. **Compile TypeScript**:
   ```bash
   tsc
   ```

4. **Open the Xojo project**:
   - Launch Xojo IDE
   - Open `src/xojo/Wordle.xojo_project`

5. **Build and run**:
   - In Xojo IDE, click "Run" to start the development server
   - The application will be available at `http://localhost:8080` (default debug port)

### Building for Production

1. **Compile TypeScript**:
   ```bash
   cd src/js/typescript
   tsc
   ```

2. **In Xojo IDE**:
   - Ensure the compiled JavaScript is in the correct location (`src/js/dist/`)
   - Choose your target platform:
     - **Web Deployment**: For hosting on a web server
     - **Desktop**: Windows, macOS, or Linux standalone application
     - **Xojo Cloud**: For cloud deployment
   - Click "Build" to create the production build

3. **Web Deployment**:
   - The build process automatically copies the compiled JavaScript to the web resources
   - Deploy the resulting web application to your web server
   - Default ports: 8080 (debug), 6583 (live)

## Game Rules

1. **Objective**: Guess the secret 5-letter word in 6 attempts or fewer
2. **Input**: Type letters using your keyboard or click the virtual keyboard
3. **Feedback**: After each guess, letters are color-coded:
   - 🟩 **Green**: Letter is correct and in the right position
   - 🟨 **Yellow**: Letter is in the word but in the wrong position
   - ⬜ **Gray**: Letter is not in the word at all
4. **Valid Words**: All guesses must be valid 5-letter words
5. **Winning**: Guess the word correctly to win
6. **Losing**: Use all 6 attempts without guessing correctly

## Game Modes

### Single Player
- Classic Wordle experience with local gameplay
- 6 attempts to guess the 5-letter word
- Immediate visual feedback with color-coded tiles
- Built-in tutorial to learn the game mechanics
- Personal best tracking

### Multiplayer
- **Create Room**: Host a game and invite friends
- **Join Room**: Enter a room code to join an existing game
- **Real-time Play**: See other players' progress in real-time
- **Lobby System**: Manage players and game settings
- **Competitive Scoring**: Compare results with other players

## Color Coding

- 🟩 **Green**: Correct letter in correct position
- 🟨 **Yellow**: Correct letter in wrong position  
- ⬜ **Gray**: Letter not in the word

## Technical Details

### Architecture
- **Web-based Application**: Built with Xojo Web Framework for cross-platform deployment
- **TypeScript Integration**: Client-side game logic with type safety
- **Real-time Multiplayer**: Session-based multiplayer with live updates
- **Responsive Design**: Adapts to different screen sizes and devices

### Key Components
- **GameController**: Core game logic and state management (TypeScript)
- **MultiplayerGame**: Handles multiplayer sessions and player management
- **WordleDictionary**: Word validation and dictionary functionality
- **Grid System**: Letter grid with visual feedback states
- **Virtual Keyboard**: Interactive keyboard with letter status tracking

### Web Technologies Used
- jQuery for DOM manipulation
- Custom CSS for styling and animations
- TypeScript compiled to ES2015
- Xojo Web SDK for backend integration

## Development

### TypeScript Development
The game controller logic is implemented in TypeScript for better type safety and modern JavaScript features. The compiled JavaScript integrates with the Xojo web framework.

### Xojo Components
- **GameController**: Core game logic and state management
- **MultiplayerGame**: Handles multiplayer session management
- **WordleDictionary**: Word validation and dictionary functionality
- **UI Components**: Custom web controls for grid, keyboard, and game interface

## Troubleshooting

### Common Issues

**TypeScript compilation fails:**
```bash
cd src/js/typescript
npm install
tsc --version  # Should show TypeScript version
tsc           # Compile TypeScript files
```

**Xojo project won't open:**
- Ensure you have Xojo 2023.04 or later
- The project uses Web2 framework features

**Game doesn't load in browser:**
- Check that the development server is running (default: localhost:8080)
- Verify that the JavaScript files are compiled in `src/js/dist/`
- Check browser console for JavaScript errors

**Multiplayer not working:**
- Ensure WebSocket connections are allowed
- Check firewall settings for the Xojo development server

## Contributing

We welcome contributions to improve Xojo Wordle! Here's how you can help:

### Development Workflow

1. **Fork and clone**:
   ```bash
   git clone https://github.com/YOUR-USERNAME/xojo-wordle.git
   cd xojo-wordle
   ```

2. **Set up development environment**:
   ```bash
   cd src/js/typescript && npm install && cd ../../..
   ```

3. **Make your changes**:
   - **TypeScript**: Edit files in `src/js/typescript/`
   - **Xojo Components**: Use Xojo IDE to modify `.xojo_code` files
   - **Always compile TypeScript**: Run `tsc` after TypeScript changes

4. **Test your changes**:
   - Open the project in Xojo IDE
   - Run and test both single-player and multiplayer modes
   - Verify TypeScript compilation works correctly

5. **Submit**:
   ```bash
   git checkout -b feature/your-feature-name
   git add .
   git commit -m "Description of your changes"
   git push origin feature/your-feature-name
   ```
   - Open a Pull Request with a clear description

### Areas for Contribution

- 🎨 **UI/UX improvements**: Better styling, animations, responsive design
- 🎯 **Game features**: New game modes, difficulty levels, statistics
- 🌐 **Multiplayer enhancements**: Better lobby system, spectator mode
- 📱 **Mobile optimization**: Touch-friendly interface improvements
- 🐛 **Bug fixes**: Check issues for reported bugs
- 📚 **Documentation**: Improve README, add code comments
- 🧪 **Testing**: Add automated tests for game logic

### Code Style

- **TypeScript**: Follow the existing ESLint configuration
- **Xojo**: Use consistent naming conventions for classes and methods
- **Comments**: Add comments for complex game logic
- **Commits**: Use clear, descriptive commit messages

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Project Information

- **Xojo Version**: 2023.04+
- **TypeScript Target**: ES2015
- **Bundle ID**: es.rcruz.wordle

## Author

**Ricardo Cruz** ([@piradoiv](https://github.com/piradoiv))
- 📧 Contact: [GitHub Profile](https://github.com/piradoiv)
- 🌐 Project: [Xojo Wordle Repository](https://github.com/piradoiv/xojo-wordle)

## Acknowledgments

- 🎮 **Inspired by**: The original [Wordle](https://www.nytimes.com/games/wordle/index.html) game by Josh Wardle
- 🛠️ **Built with**: [Xojo](https://www.xojo.com/) - Cross-platform development made easy
- 💻 **TypeScript**: For type-safe client-side development
- 🎨 **Design**: Clean, accessible interface inspired by the original game

## Links

- 📖 **Xojo Documentation**: [developer.xojo.com](https://developer.xojo.com/)
- 📘 **TypeScript Docs**: [typescriptlang.org](https://www.typescriptlang.org/)
- 🎮 **Original Wordle**: [nytimes.com/games/wordle](https://www.nytimes.com/games/wordle/)

---

<p align="center">
  <strong>Made with ❤️ and <a href="https://www.xojo.com/">Xojo</a></strong><br>
  <em>Cross-platform development for everyone</em>
</p>
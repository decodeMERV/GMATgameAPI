import React, { Component } from 'react';
import { Link } from 'react-router';
import './App.css';
import auth from './auth.js';
import DescriptiveTextBox from './elements/DescriptiveTextBox';

class App extends Component {
  constructor() {
    super();
    this.state = {
      avatarUrl: "",
    }
  }

  componentDidMount(){
    if (this.props.loggedIn){
      this.fetchUserProfile();
    }
  }

  fetchUserProfile = () => {
    auth.getCurrentLoggedInUser(auth.getToken())
      .then( (res) => {
        this.setState({
          username : res.body.username,
          avatarUrl : res.body.avatarUrl,
        })
      })
  }

  componentWillReceiveProps(newProps) {
    if (newProps.loggedIn !== this.props.loggedIn) {
      if (newProps.loggedIn) {
        this.fetchUserProfile();
      }
      else {
        this.setState({ avatarUrl: "" });
      }
    }
  }

  render() {
    console.log("RENDERED");
    return (
      <div className="App">
        <div className="App-navbar">
          <Link to="/" className="App-navbar__title">
            GMAT Trainer
          </Link>
          <Link to="/play" className="play-button">
            PLAY
          </Link>
          {
            auth.isLoggedIn() ?
              <div>
                <DescriptiveTextBox
                  onClick={() => {
                    auth.logout()
                      .then( () => {
                        this.setState({avatarUrl: "", username:undefined});
                        this.props.router.push('/');
                      })
                  }}
                  theText="LOGOUT"
                />
                <Link to="/dashboard">
                  <img src={this.state.avatarUrl} alt="gravatarIcon" style={{borderRadius:"50%", maxWidth:"2rem", backgroundColor:"black"}}/>
                </Link>
                <DescriptiveTextBox theText={this.state.username}/>
              </div>
              :
              null
          }
        </div>
        {React.cloneElement(this.props.children, {loggedInProp :this.props.loggedIn} )}
      </div>
    );
  }
}

export default App;

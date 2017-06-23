import React from 'react';
import { withRouter } from 'react-router-dom';


class Input extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      content: '',
      kind: 'normal',
      channel_id: null,
      user_id: this.props.currentUser.id};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(type) {
    return (e) => {
      this.setState({[type]: e.currentTarget.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    let channelId = parseInt(this.props.history.location.pathname.slice(6));
    this.state.channel_id = channelId;
    const messageData = Object.assign({}, this.state);
    this.props.createMessage(messageData)
    .then(() =>this.setState({content: ''}));
  }

  render() {
    return(
      <div>
        <h1>INPUT</h1>
        <form onSubmit={this.handleSubmit}>
          <input
            placeholder="Write a message!"
            onChange={this.handleChange('content')}
            type="text"
            value={this.state.content}>
          </input>
        </form>
      </div>
    );
  }
}

export default withRouter(Input);

import React from 'react';
import selector from '../../../../util/selector';
import { Link, Route, withRouter, NavLink } from 'react-router-dom';

import Modal from 'react-modal';
import NewChannel from './new_channel';
import NewDm from './new_dm';

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : '60%',
    bottom                : 'auto',
    marginRight           : '-30%',
    transform             : 'translate(-50%, -50%)'
  }
};

class Channels extends React.Component {
  constructor(props) {
    super(props);
    this.state = { channelModal: false, dmModal: false };

    this.requestAllUsersOfChannel = this.requestAllUsersOfChannel.bind(this);
    this.openModal = this.openModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
  }

  openModal(type) {
    return () => {
      this.setState({[type]: true});
    };
  }

  closeModal(type) {
    return () => {
      this.setState({[type]: false});
    };
  }

  componentWillMount() {
      Modal.setAppElement('body');
   }

  requestAllUsersOfChannel(channel_id) {
    return () => {
      this.props.requestAllUsersOfChannel(channel_id);
    };
  }

  render() {
    return(
      <div>
        <ul>
          <h1
            onClick={this.openModal("channelModal")}
            className="channel-directmessage-heading">
            <span className="channels-icon">CHANNELS</span>
            <i className="fa fa-plus-circle" aria-hidden="true"></i>
          </h1>
          <Modal
            onRequestClose={this.closeModal("channelModal")}
            style={customStyles}
            contentLabel="Modal"
            isOpen={this.state.channelModal}
            onClose={this.closeModal("channelModal")}>
            <NewChannel closeModal={this.closeModal('channelModal')}/>
          </Modal>
          <ul className="channel-list channel-unique">
            {
              selector(this.props.channels).map(channel =>
                <li
                  onClick={this.requestAllUsersOfChannel(channel.id)}
                  key={channel.created_at}>
                  <NavLink
                    exact to={`/main/${channel.id}`}
                    activeClassName="selected">
                    <span className="pound-sign">#</span>
                    {"  " + channel.name}
                  </NavLink>
                </li>
              )
            }
          </ul>
        </ul>
        <ul>
          <h1
            onClick={this.openModal('dmModal')}
            className="channel-directmessage-heading">
            <span className="dm-icon">DIRECT MESSAGES</span>
            <i className="fa fa-plus-circle" aria-hidden="true"></i>
          </h1>
          <Modal
            onRequestClose={this.closeModal('dmModal')}
            style={customStyles}
            contentLabel="Modal"
            isOpen={this.state.dmModal}
            onClose={this.closeModal('dmModal')}>
            <NewDm closeModal={this.closeModal('dmModal')}/>
          </Modal>
          <ul className="channel-list">
            {
              selector(this.props.directMessages).map(directMessage =>
                <li
                  onClick={this.requestAllUsersOfChannel(directMessage.id)}
                  key={directMessage.created_at}>
                  <NavLink
                    exact to={`/main/${directMessage.id}`}
                    activeClassName="selected">
                    <span className="pound-sign">@</span>
                    {"  " + directMessage.name}
                  </NavLink>
                </li>
              )
            }
          </ul>
        </ul>

      </div>
    );
  }
}

export default withRouter(Channels);

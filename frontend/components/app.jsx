import React from 'react';
// import GreetingContainer from './greeting/greeting_container';
// import SessionFormContainer from './sessionForm/session_form_container';
import { Route } from 'react-router-dom';
import { AuthRoute } from '../util/route_util';
import FrontPage from './frontpage/front_page';
import MainPageContainer from './mainpage/mainpage_container';

export const App = () => (
  <div>
    <Route exact path="/" component={FrontPage} />
    <Route path="/main" component={MainPageContainer} />
  </div>
);

// <AuthRoute path="/login" component={SessionFormContainer} />
// <AuthRoute path="/signup" component={SessionFormContainer} />

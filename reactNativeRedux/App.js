import React from 'react';
import 'react-native-console-time-polyfill';

import Home from './src/screen/home/home';
import Kehilangan from './src/screen/kehilangan/kehilanganPage';

import Search from './src/screen/kehilangan/kehilanganSearch';
import { Provider } from 'react-redux';
import store from './src/library/redux/store';

import Detail from './src/screen/kehilangan/kehilanganDetailPage';
import { createStackNavigator} from '@react-navigation/stack';
import { NavigationContainer } from '@react-navigation/native';

const ReactNativeApp = () => {


  const Stack = createStackNavigator();

  function MyStack() {
    return(
      <Stack.Navigator
        headerMode="none"
        >
        <Stack.Screen name="Home" component={Home} />
        <Stack.Screen name="Kehilangan" component={Kehilangan} />
        <Stack.Screen name="Detail" component={Detail} />
        <Stack.Screen name="Search" component={Search} />
    </Stack.Navigator>
    )
  }

  return (
    <Provider store={store}>
      <NavigationContainer>
        <MyStack />
      </NavigationContainer>
    </Provider>
  )
}

export default ReactNativeApp;
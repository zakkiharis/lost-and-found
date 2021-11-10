import React, { Component } from 'react';

import { View, Text, Image, TouchableOpacity, StyleSheet } from 'react-native';
import images from '../res/images'
import {Header} from 'react-native-elements';
import PropTypes from 'prop-types';

class HeaderComponents extends Component{
    render(){
        return (
            <View>
                <Header
                    leftComponent={
                        <TouchableOpacity
                        onPress={this.props.leftOnPress}>
                            <View style={{ paddingLeft: 15 }}>
                                <Image
                                    style={{ width: 22, height: 22 }}
                                    source={images.bars} />
                            </View>
                        </TouchableOpacity>
                    }
                    centerComponent={
                        <View>
                            <Text style={styles.textCenter}>{this.props.centerText}</Text>
                        </View>
                    }
                    rightComponent={
                        <TouchableOpacity
                        onPress={this.props.rightOnPress}>
                            <View style={{ paddingRight: 15 }}>
                                <Image
                                    style={{ width: 24, height: 24 }}
                                    source={images.cog} />
                            </View>
                        </TouchableOpacity>
                    }
                />
            </View>
        )
    }
}

HeaderComponents.propTypes = {
    centerText: PropTypes.string,
    leftOnPress: PropTypes.func,
    rightOnPress: PropTypes.func,
};

export default HeaderComponents;

const styles = StyleSheet.create({
    textCenter:{
        color: 'white',
        fontSize: 22,
        fontWeight: 'bold'
    },
})

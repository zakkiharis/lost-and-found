import React  from 'react';
import { View, Text,  Image, TouchableOpacity } from 'react-native';


const ListItem = ({ kehilangan }) => {

    <TouchableOpacity onPress={() => null}>
        <View>
            {/* <Image style={{}} source={{ uri: item.uriToImage }} /> */}
            <Text>{kehilangan.nama}</Text>
        </View>
    </TouchableOpacity>
}

export default ListItem;

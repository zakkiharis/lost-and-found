import React, { Component } from 'react';
import { View, Text, StyleSheet, Image, ActivityIndicator, FlatList, SafeAreaView, TouchableOpacity } from 'react-native';
import images from 'res/images';
import { connect } from 'react-redux';
import { fetchSources } from '../../library/redux/reducer/reducerKehilangan';

import 'react-native-console-time-polyfill';



class Kehilangan extends Component {

    constructor(props){
        super(props);
        this.componentDidMount();
    }

    componentDidMount() {
        this.props.dispatch(fetchSources())
    }
    
    render() {
        const { sourcesKehilangan, navigation } = this.props;
        
        return (
            <View style={styles.container} >   
            <View style={styles.header}>
                <TouchableOpacity
                    onPress={()  => navigation.navigate('Home')}>
                    <View style={{ paddingLeft: 15, paddingTop: 15 }}>
                        <Image
                            style={{ width: 20, height: 20}}
                            source={images.bars} />
                    </View>
                </TouchableOpacity>
                <View>
                    <Text style={{ color: 'white', fontSize: 22, fontWeight: 'bold', marginTop: 8 }}>Barang Hilang</Text>
                </View>
                <TouchableOpacity
                    onPress={()  => navigation.navigate()}>
                    <View style={{ paddingRight: 15, marginTop: 15}}>
                        <Image
                            style={{ width: 24, height: 24 }}
                            source={images.cog} />
                    </View>
                </TouchableOpacity>
                    
                </View>
                
                <View style={styles.body}>
                    <View style={styles.list}>
                        <SafeAreaView style={styles.container}>
                            <FlatList
                                data={sourcesKehilangan}
                                keyExtractor={item => item.id}
                                renderItem={({item}) => (
                                    <TouchableOpacity
                                        key={item.key}
                                        onPress={() => navigation.navigate('Detail',{
                                            nama: item.nama,
                                            nama_barang: item.nama_barang,
                                            jenis_barang: item.jenis_barang,
                                            nomor_hp: item.nomor_hp,
                                            detail_informasi: item.detail_informasi
                                        })}>
                                        <View style={styles.item}>
                                            <Image
                                                style={{ height: 50, width: 50, marginRight: 10, marginVertical: 1 }}
                                                source={images.buku} />
                                            <View style={{ flex: 1 }}>
                                                <View style={{ flexDirection: 'row' }}>
                                                    <Text style={styles.textList}>Barang : </Text>
                                                    <Text style={{ fontSize: 14 }}>{item.nama_barang}</Text>
                                                </View>
                                                <View style={{ flexDirection: 'row' }}>
                                                    <Text style={styles.textList}>Jenis : </Text>
                                                    <Text style={{ fontSize: 14 }}>{item.jenis_barang}</Text>
                                                </View>
                                                <View style={{ flexDirection: 'row' }}>
                                                    <Text style={{ fontSize: 14 }}><Text style={styles.textList}>Deskripsi : </Text>{item.detail_informasi} </Text>
                                                </View>
                                            </View>
                                        </View>
                                    </TouchableOpacity>
                                )}
                            />
                        </SafeAreaView>
                    </View> 
                </View>
                
                <View>
                    <TouchableOpacity 
                        activeOpacity={0.7} 
                        style={styles.touchableOpacity}
                        onPress={()  => navigation.navigate('Search')}
                        >
                        <Image 
                            style={styles.floatingStyle}
                            source={images.search} />
                    </TouchableOpacity>
                </View>
                
            </View >
        );
    }
    
}


const mapStateToProps = state => ({

    sourcesKehilangan: state.sourcesKehilangan.data
});
export default connect(mapStateToProps, null)(Kehilangan);


const styles = StyleSheet.create({
    container: {
        flex: 1,
    },
    item: {
        backgroundColor: 'white',
        paddingLeft: 10,
        paddingVertical: 1,
        marginVertical: 3,
        marginHorizontal: 20,
        borderRadius: 10,
        flexDirection: 'row',
        alignItems: 'center'
    },
    header: {
        flex: 1,
        backgroundColor: 'rgba(88, 246, 214, 1.0)',
        justifyContent: 'space-between',
        alignItems: 'center',
        flexDirection: 'row',
    },
    body: {
        justifyContent: 'center',
        alignItems: 'center',
        flex: 10,
        backgroundColor: 'rgba(241,241,241, 1.0)',
    },
    search: {
        marginTop: 8,
        marginBottom: 10,
        height: '7%',
        backgroundColor: 'white',
        width: '90%',
        borderRadius: 10,
        flexDirection: 'row',
        alignItems: 'center'
    },
    list: {
        backgroundColor: 'rgba(241,241,241, 1.0)',
        flex: 10,
        width: '100%'
    },
    textList: {
        fontSize: 14,
        fontWeight: 'bold',
    },
    touchableOpacity: {
        position: 'absolute',
        width: 50,
        height: 50,
        alignItems: 'center',
        justifyContent: 'center',
        right: 30,
        bottom: 30,
        borderWidth:1,
        borderColor:'rgba(0,0,0,0.2)',
        backgroundColor:'rgba(88, 246, 214, 1.0)',
        borderRadius:50,
    },
    floatingStyle: {
        resizeMode: 'contain',
        width: 25,
        height: 25,
    },
    textCenter:{
        color: 'white',
        fontSize: 22,
        fontWeight: 'bold'
    },
    
})

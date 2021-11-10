import React, { Component } from 'react';
import {View, Text, StyleSheet, Image, TouchableOpacity} from 'react-native';
import images from 'res/images';

class KehilanganDetail extends Component {
    render(){
        const { nama, nama_barang, nomor_hp, detail_informasi  } = this.props.route.params;
        const { navigation } = this.props;
        return(
            <View style={styles.container}>

                <View style={styles.header}>
                <TouchableOpacity
                    onPress={()  => navigation.navigate('Kehilangan')}>
                    <View style={{ paddingLeft: 15, paddingTop: 15 }}>
                        <Image
                            style={{ width: 24, height: 20}}
                            source={images.back} />
                    </View>
                </TouchableOpacity>
                <View>
                    <Text style={{ color: 'white', fontSize: 22, fontWeight: 'bold', marginTop: 8 }}>Barang Hilang</Text>
                </View>
                    <View style={{ paddingRight: 15, marginTop: 15}}>
                        <Image
                            style={{ width: 24, height: 24 }}
                            source={images.cog} />
                    </View>
                </View>
                
                <View style={styles.top}>
                    <View style={styles.topLeft}>
                        <View style={{elevation: 15, backgroundColor:'white'}} >
                        <Image 
                            style={{ height: 100, width: 100}}
                            source={images.buku} />
                        </View>
                        <Text>1 Buah</Text>
                    </View>
                    <View style={styles.topRight}>
                        <Text style={{fontSize: 16, fontWeight: 'bold', paddingTop: 16.0}}>{nama_barang}</Text>
                        <Text style={{fontSize: 12, color: 'red', paddingTop: 8.0, paddingBottom: 16.0}}>Ditemukan Oleh : {nama}</Text>
                        <Text style={{fontSize: 14, fontWeight: 'bold'}}>No. Telp : {nomor_hp}</Text>
                    </View>
                </View>
                <View style={styles.bottom}>
                    <Text style={{paddingTop: 10, paddingLeft: 10,fontWeight:'bold'}}>Detail informasi</Text>
                    <Text style={styles.textBottom}>{detail_informasi}</Text>
                </View>
            </View>
        )
    }
}

export default KehilanganDetail;

const styles = StyleSheet.create({
    container: {
        flex: 1,
    },
    header: {
        height: 50,
        backgroundColor: 'rgba(88, 246, 214, 1.0)',
        justifyContent: 'space-between',
        flexDirection: 'row',
        elevation: 5,
    },
    top: {
        flex: 3.5,
        flexDirection:'row',
        backgroundColor: 'rgba(88, 246, 214, 100)'
    },
    bottom:{
        flex: 6.5,
    },
    textBottom:{
        padding: 10,
    },
    topLeft:{
        flex: 2,
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
    },
    topRight:{
        flex: 3,
    }
})
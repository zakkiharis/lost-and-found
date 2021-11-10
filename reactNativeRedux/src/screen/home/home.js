import React from 'react';
import { Text, StyleSheet, Image, View, TouchableOpacity } from 'react-native';
import images from 'res/images';

function Home({navigation}) {
    return (
        <View style={styles.container} >
            <View style={styles.header}>
                <TouchableOpacity
                onPress={()  => navigation.navigate('Home')}>
                <View style={{ paddingLeft: 15 }}>
                    <Image
                        style={{ width: 24, height: 20 }}
                        source={images.bars} />
                </View>
                </TouchableOpacity>
                <View>
                    <Text style={{ color: 'white', fontSize: 22, fontWeight: 'bold' }}>Home</Text>
                </View>
                <View style={{ paddingRight: 15 }}>
                    <Image
                        style={{ width: 24, height: 24 }}
                        source={images.cog} />
                </View>
            </View>
            <View style={styles.body}>
                <View style={styles.hello}>
                    <Text style={{ fontSize: 25.0, color: 'white' }}>Hello Zakki A Haris</Text>
                    <Text style={{ fontSize: 25.0, color: 'white' }}>Selamat Datang</Text>
                </View>
                <View style={{}}>
                    <Text style={{ fontSize: 25.0, color: 'white' }}>Lost and Found</Text>
                </View>
                <View style={{ flexDirection: 'row' }}>
                    <TouchableOpacity
                    onPress={() => navigation.navigate('Kehilangan')}>
                        <View style={styles.menu}>
                            <View>
                            <Image
                                style={{ width: 90, height: 90 }}
                                source={images.barang_hilang}
                            />
                            </View> 
                        </View>
                        <Text style={{paddingTop: 12, textAlign: 'center' , color: 'white'}}>
                                Barang Hilang
                        </Text>
                    </TouchableOpacity>
                    <TouchableOpacity>
                        <View style={styles.menu}>
                            <Image
                                style={{ width: 90, height: 90 }}
                                source={images.barang_temuan}
                            />
                        </View>
                        <Text style={{paddingTop: 12, textAlign: 'center' , color: 'white'}}>
                                Barang Temuan
                        </Text>
                    </TouchableOpacity>
                </View>
                <View style={{ flexDirection: 'row' }}>
                    <TouchableOpacity>
                        <View style={styles.menu}>
                            <Image 
                                style={{width: 90, height: 90}}
                                source={images.profile}
                            />
                        </View>
                        <Text style={{paddingTop: 12, textAlign: 'center' , color: 'white'}}>
                                Profile
                        </Text>
                    </TouchableOpacity>
                    <TouchableOpacity>
                        <View style={styles.menu}>
                            <Image style={{width: 90, height: 90}}
                            source={images.setting}
                            />
                        </View>
                        <Text style={{paddingTop: 12, textAlign: 'center' , color: 'white'}}>
                                Setting
                        </Text>
                    </TouchableOpacity>
                </View>
            </View>
        </View >
    )
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
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
        backgroundColor: 'rgba(58, 40, 80, 1.0)',
    },
    menu: {
        margin: 30,
        marginBottom: 5,
        backgroundColor: 'white',
        height: 100,
        width: 100,
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 10
    },
    hello: {
        borderRadius: 20,
        height: 100,
        width: 300,
        backgroundColor: 'rgba(88, 246, 214, 1.0)',
        justifyContent: 'center',
        alignItems: 'center',
    }
})

export default Home;
import React, {Component} from 'react';
import { View, Text, FlatList, ActivityIndicator, StyleSheet } from 'react-native';
import { SearchBar } from 'react-native-elements';
import { fetchSources } from '../../library/redux/reducer/reducerKehilangan';
import { connect } from 'react-redux';
import { TouchableOpacity } from 'react-native-gesture-handler';

class kehilangaSearch extends Component{
    
    constructor(props) {

        super(props);

        this.state = {
            isLoading: true,
            text: '',
            data: []
        }

        const {sourcesKehilangan} = this.props;

        this.arrayholder = sourcesKehilangan;

    }

    componentDidMount() {
        this.props.dispatch(fetchSources());
    }
    
    searchFilterFunction = text => {

        this.setState({
            value: text,
        });

        const newData = this.arrayholder.filter(item => {
            const itemData = `${item.nama.toUpperCase()} ${item.jenis_barang.toUpperCase()} ${item.detail_informasi.toUpperCase()}`;
            const textData = text.toUpperCase();

            return itemData.indexOf(textData) > -1;
        });

        this.setState({
            data: newData,
        });
    };

    renderHeader = () => {
        return (
            <SearchBar
            placeholder="Cari"
            leftIcon
            containerStyle={{backgroundColor: 'rgba(88, 246, 214, 1.0)'}}
            lightTheme
            onChangeText={text => this.searchFilterFunction(text)}
            autoCorrect={false}
            value={this.state.value}
            />
        );
    };

    render() {
        const { navigation } = this.props;
        if (this.state.loading) {
            return (
            <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
                <ActivityIndicator />
            </View>
            );
        }
        return (
            <View style={{ flex: 1 }}>
            <FlatList
                data={this.state.data}
                renderItem={({ item }) => (
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
                keyExtractor={item => item.id}
                ItemSeparatorComponent={this.renderSeparator}
                ListHeaderComponent={this.renderHeader}
            />
            </View>
        );
    } 
}

const mapState2Props = state => ({
    sourcesKehilangan: state.sourcesKehilangan.data,
});

export default connect(mapState2Props, null)(kehilangaSearch);

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
})






// import React, {Component} from 'react';
// import {View, Text, TextInput, StyleSheet} from 'react-native';


// class Search extends Component {
//     state = {
//         search: '',
//     };

//     filterList(list) {
//         return list.filter(listItem => listItem.toLowerCase().includes(this.state.search.toLowerCase()));
//     }

//     render() {
//         const { actionSearch} = this.props;
//         const list = ['The Weeknd', 'Drake', 'Roddy Ricch', 'Dua Lipa'];
//         console.log('start');
//         console.log(actionSearch);
//         console.log('end');
//         return (
//         <View style={styles.container}>
//             <TextInput
//             onChangeText={(search) => this.setState({search})}
//             style={styles.searchBar}
//             />
//             {this.filterList(list).map((listItem, index) => (
//             <Text key={index} style={styles.itemText}>{listItem}</Text>
//             ))}
//         </View>
//         );
//     }
// }


// const mapStateToProps = state => ({
//     search : state.actionSearch.data
// });

// export default Search;

// const styles = StyleSheet.create({
//     container: {
//         backgroundColor: 'black',
//         alignItems: 'center',
//         height: '100%',
//     },
//     searchBar: {
//         fontSize: 24,
//         margin: 10,
//         width: '90%',
//         height: 50,
//         backgroundColor: 'white',
//     },
//     itemText: {
//         margin: 10,
//         color: 'white',
//         fontSize: 24,
//         backgroundColor: 'red',
//         width: '100%',
//         height: 50
//     }
// });



// const flatListDemo = () => {

//     renderSeparator = () => {
//         return (
//         <View
//             style={{
//             height: 1,
//             width: '86%',
//             backgroundColor: '#CED0CE',
//             marginLeft: '14%',
//             }}
//         />
//         );
//     };

//     searchFilterFunction = text => {
//         this.setState({
//             value: text,
//         });

//         const newData = this.sourcesKehilangan.filter(item => {
//         const itemData = `${item.name.title.toUpperCase()} ${item.name.first.toUpperCase()} ${item.name.last.toUpperCase()}`;
//         const textData = text.toUpperCase();

//         return itemData.indexOf(textData) > -1;
//         });
//         this.setState({
//         data: newData,
//         });
//     };

//     renderHeader = () => {
//         return (
//             <SearchBar
//                 placeholder="Type Here..."
//                 lightTheme
//                 round
//                 onChangeText={text => this.searchFilterFunction(text)}
//                 autoCorrect={false}
//                 value={this.state.value}
//             />
//         );
//     };
    
    
//         if (this.state.loading) {
//         return (
//             <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
//                 <ActivityIndicator />
//             </View>
//             );
//         }
//         return (
//         <View style={{ flex: 1 }}>
//             <FlatList
//                 data={this.state.data}
//                 renderItem={({ item }) => (
//                     <ListItem
//                         leftAvatar={{ source: { uri: item.picture.thumbnail } }}
//                         title={`${item.name.first} ${item.name.last}`}
//                         subtitle={item.email}
//                     />
//             )}
//             keyExtractor={item => item.email}
//             ItemSeparatorComponent={this.renderSeparator}
//             ListHeaderComponent={this.renderHeader}
//             />
//         </View>
//         );
    
// }


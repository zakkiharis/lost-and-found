import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { render, fireEvent } from '@testing-library/react-native';

import '@testing-library/jest-native/extend-expect';

import App from '../App';

jest.mock('react-native/Libraries/Animated/src/NativeAnimatedHelper');

describe('Integratrion Testing', () =>{
    test('Click to list kehilangan', async () => {
        const component = (
            <NavigationContainer>
                <App />
            </NavigationContainer>
        );

        const {findByText} = render(component);
        const toClick = await findByText('Barang Hilang');
        
        fireEvent(toClick, 'press');
        const header = await findByText('Barang Hilang');
        expect(header).toBeTruthy();
    });
    
    test('Test components header dan 50 item data', async () => {
        const component = (
            <NavigationContainer>
                <Kehilangan />
            </NavigationContainer>
        );

        const { findByText, findAllByText} = render(component);
        const header = await findByText('Barang Hilang');
        const items = await findAllByText(50);

        expect(header).toBeTruthy();
        expect(items.length).toBe(50);
    });

    test('clicking on one item takes you to the details screen', async () => {
        const component = (
            <NavigationContainer>
                <KehilanganDetail/>
            </NavigationContainer>
        );
    
        const { findByText } = render(component);
        const toClick = await findByText('Kaos Kaki Hitam');
    
        fireEvent(toClick, 'press');
        const newHeader = await findByText('Barang Hilang');
        const newBody = await findByText('Ditemukan Oleh : Zakki Haris');
    
        expect(newHeader).toBeTruthy();
        expect(newBody).toBeTruthy();
    });
});
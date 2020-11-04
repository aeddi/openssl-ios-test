import React, {useState} from 'react';
import {SafeAreaView, Button, Text, NativeModules} from 'react-native';

const App: () => React$Node = () => {
	const [result, setResult] = useState("");

	return (
		<>
			<SafeAreaView style={{height: '100%', justifyContent: 'center'}}>
				<Button
					title="Test"
					onPress={async() => setResult(await NativeModules.Bridge.test())}
				/>
				<Text>{result}</Text>
			</SafeAreaView>
		</>
	);
};

export default App;

package com.trusted.donation.calculadora_compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.MaterialTheme
import androidx.compose.material.OutlinedButton
import androidx.compose.material.Scaffold
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.material.TextField
import androidx.compose.material.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.trusted.donation.calculadora_compose.ui.theme.Calculadora_composeTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Calculadora_composeTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    Scaffold (
                        topBar = { TopAppBar(title = { Text("Calculator") }) },
                        content = { Calculate() }
                    )
                }
            }
        }
    }
}

//stateful
@Composable
fun Calculate() {
    var firstOperator by rememberSaveable { mutableStateOf("") }
    var secondOperator by rememberSaveable { mutableStateOf("") }
    var result by rememberSaveable { mutableStateOf("No value yet!") }

    Column (
        modifier = Modifier.padding(16.dp)
    ) {
        TextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 12.dp),
            value = firstOperator,
            onValueChange = { newText ->
                firstOperator = newText
            },
            label = { Text(text = "First Operator") },
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
            placeholder = { Text(text = "Type your first operator") },
        )
        TextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 12.dp),
            value = secondOperator,
            onValueChange = { newText ->
                secondOperator = newText
            },
            label = { Text(text = "Second Operator") },
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
            placeholder = { Text(text = "Type your second operator") },
        )
        Text(result)
        OutlinedButton(onClick = {
            val sum = firstOperator.toInt() + secondOperator.toInt()
            result = "The result is $sum";
        }) {
            Text(text = "Calculate")
        }
    }
}

@Preview(
    showBackground = true)
@Composable
fun DefaultPreview() {
    Calculadora_composeTheme {
        Calculate()
    }
}
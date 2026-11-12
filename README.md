# 🚦 Sistema de Semáforo Inteligente IoT (Arduino & Flutter)

Proyecto académico e integrador que combina el desarrollo de software de escritorio con Flutter y sistemas embebidos utilizando una placa Elegoo UNO R3 (compatible con Arduino Uno). El sistema permite controlar la lógica física de un cruce vial y peatonal en tiempo real mediante comunicación serial UART.

## 🛠️ Tecnologías y Hardware Utilizado
* **Hardware:**
  * Placa Elegoo UNO R3 (Microcontrolador ATmega328P).
  * 3 LEDs (Rojo, Amarillo, Verde) con resistencias de protección de 220Ω.
  * 1 Botón Pulsador (configurado con resistencia Pull-Up interna).
  * Cables Dupont y Protoboard.
* **Software:**
  * **Arduino IDE (C++):** Lógica del microcontrolador, interrupciones y recepción de tramas seriales.
  * **Flutter (Dart):** Interfaz gráfica de centro de control para escritorio en Windows.

---

## 📐 Esquema de Conexiones Físicas (Pines)

| Componente | Pin en Elegoo UNO R3 | Descripción Física |
| :--- | :--- | :--- |
| **LED Verde** | Pin Digital 2 | Polo positivo con resistencia de 220Ω hacia el pin |
| **LED Rojo** | Pin Digital 3 | Polo positivo con resistencia de 220Ω hacia el pin |
| **LED Amarillo** | Pin Digital 4 | Polo positivo con resistencia de 220Ω hacia el pin |
| **Botón Peatonal** | Pin Digital 5 | Conectado a GND (Tierra) usando `INPUT_PULLUP` |

---

## ⚙️ Instrucciones de Ejecución

### 1. Cargar el Código en el Microcontrolador
1. Abre el archivo en C++ en el **Arduino IDE**.
2. Conecta tu placa Elegoo UNO R3 por USB a la computadora.
3. Selecciona tu placa (`Arduino Uno`) y el puerto COM correspondiente en **Herramientas > Puerto**.
4. Sube el código a la placa.

### 2. Ejecutar el Centro de Control en Flutter
1. Asegúrate de tener habilitado el *Modo de Desarrollador* en Windows (necesario para plugins de bajo nivel).
2. Abre la terminal en la carpeta del proyecto Flutter.
3. Ejecuta el comando de dependencias:
import 'package:flutter/material.dart';

class ControlCenterScreen extends StatefulWidget {
  const ControlCenterScreen({super.key});

  @override
  State<ControlCenterScreen> createState() => _ControlCenterScreenState();
}

class _ControlCenterScreenState extends State<ControlCenterScreen> {
  // Valores de los tiempos en segundos
  double tiempoVerde = 4.0;
  double tiempoAmarillo = 2.0;
  double tiempoRojo = 4.0;
  double tiempoPeatonal = 5.0;

  void enviarConfiguracionAlHardware() {
    // Aquí se realiza la transmisión de datos por el puerto serial USB 
    // (Ejemplo utilizando el paquete flutter_libserialport o comandos nativos)
    int msVerde = (tiempoVerde * 1000).toInt();
    int msAmarillo = (tiempoAmarillo * 1000).toInt();
    int msRojo = (tiempoRojo * 1000).toInt();
    int msPeaton = (tiempoPeatonal * 1000).toInt();

    // Simulación de envío por consola de depuración
    debugPrint("CONFIG:V$msVerde");
    debugPrint("CONFIG:A$msAmarillo");
    debugPrint("CONFIG:R$msRojo");
    debugPrint("CONFIG:P$msPeaton");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Tiempos aplicados al semáforo físico en tiempo real!'),
        backgroundColor: Color(0xFF548C27),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centro de Control - Semáforo IoT'),
        backgroundColor: const Color(0xFF022933),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEEE8D6), Color(0xFFD5CDB5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Text(
                      'Gestión de Tiempos del Semáforo',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF022933),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ajusta los selectores para modificar la duración de cada ciclo del semáforo físico conectado por USB.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(height: 30),

                    // Sliders para cada luz
                    _buildSliderRow(
                      'Tiempo de Luz Verde',
                      '${tiempoVerde.toStringAsFixed(1)} s',
                      tiempoVerde, 1.0, 10.0, Colors.green,
                      (val) => setState(() => tiempoVerde = val),
                    ),
                    _buildSliderRow(
                      'Tiempo de Luz Amarilla',
                      '${tiempoAmarillo.toStringAsFixed(1)} s',
                      tiempoAmarillo, 1.0, 5.0, Colors.amber.shade800,
                      (val) => setState(() => tiempoAmarillo = val),
                    ),
                    _buildSliderRow(
                      'Tiempo de Luz Roja',
                      '${tiempoRojo.toStringAsFixed(1)} s',
                      tiempoRojo, 1.0, 10.0, Colors.red,
                      (val) => setState(() => tiempoRojo = val),
                    ),
                    _buildSliderRow(
                      'Cruce Peatonal (Modo Botón)',
                      '${tiempoPeatonal.toStringAsFixed(1)} s',
                      tiempoPeatonal, 2.0, 15.0, Colors.blueAccent,
                      (val) => setState(() => tiempoPeatonal = val),
                    ),

                    const SizedBox(height: 24),

                    // Botón de sincronización
                    ElevatedButton.icon(
                      onPressed: enviarConfiguracionAlHardware,
                      icon: const Icon(Icons.sync, color: Colors.white),
                      label: const Text(
                        'Sincronizar con Hardware',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0076A3),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliderRow(
    String title,
    String valueText,
    double value,
    double min,
    double max,
    Color color,
    ValueChanged<double> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              Text(valueText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: ((max - min) * 2).toInt(),
            activeColor: color,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
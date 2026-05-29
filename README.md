# URL Proyecto Arobles BInarios
Aplicación web:
https://creacionarbolesbinarios.netlify.app/
Repositorio:

# Sistema Interactivo de Árboles Binarios

Aplicación web desarrollada en Flutter para la construcción, visualización, recorrido y reconstrucción de árboles binarios de manera interactiva.

---

# Características

- Construcción manual de árboles binarios
- Inserción de nodos izquierdos y derechos
- Visualización gráfica interactiva
- Reconstrucción de árboles mediante recorridos
- Recorridos:
  - Preorden
  - Inorden
  - Postorden
- Zoom y desplazamiento del árbol
- Validaciones y mensajes personalizados
- Interfaz moderna y responsive

---

# Arquitectura del Proyecto

El proyecto fue desarrollado utilizando una arquitectura modular basada en separación de responsabilidades.

## Estructura General

```bash
lib/
│
├── controllers/
├── models/
├── screens/
├── widgets/
├── visual_tree/
├── services/
├── core/
└── main.dart
```

---

# Tecnologías Utilizadas

- Flutter
- Dart
- Provider
- Material Design 3
- CustomPainter

---

# Instalación y Ejecución

## Clonar repositorio

```bash
git clone URL_DEL_REPOSITORIO
```

## Ingresar al proyecto

```bash
cd nombre_proyecto
```

## Instalar dependencias

```bash
flutter pub get
```

## Ejecutar aplicación

```bash
flutter run
```

---

# Ejecución Web

```bash
flutter run -d chrome
```

---

# Funcionalidades Implementadas

## Construcción del Árbol

Permite crear árboles binarios manualmente mediante inserciones izquierdas y derechas.

### Características

- Creación de nodo raíz
- Inserción de hijos izquierdos
- Inserción de hijos derechos
- Validaciones automáticas
- Prevención de nodos inválidos
- Limpieza dinámica del árbol

---

## Reconstrucción del Árbol

Reconstrucción automática utilizando recorridos:

- Preorden
- Inorden

El sistema genera automáticamente la estructura visual del árbol reconstruido.

---

## Recorridos Implementados

Visualización independiente de:

- Preorden
- Inorden
- Postorden

Los resultados se muestran de forma clara e interactiva para el usuario.

---

## Visualización Interactiva

Renderizado dinámico del árbol mediante Canvas utilizando Flutter.

### Incluye

- Zoom interactivo
- Desplazamiento libre
- Diseño moderno
- Nodos personalizados
- Líneas estilizadas
- Sombras y gradientes
- Renderizado optimizado

---

# Diseño y Experiencia de Usuario

- Interfaz moderna
- Navegación intuitiva
- Componentes reutilizables
- Mensajes visuales personalizados
- SnackBars personalizados
- Validaciones dinámicas
- Diseño responsive
- Dashboard moderno

---

# Gestión de Estado

El proyecto utiliza `Provider` para:

- Actualización reactiva de la interfaz
- Gestión centralizada del estado
- Sincronización visual
- Comunicación entre componentes

---

# Arquitectura Modular

El sistema fue dividido en módulos para mantener:

- Escalabilidad
- Mantenimiento sencillo
- Reutilización de componentes
- Separación de responsabilidades

## Módulos principales

### Controllers

Lógica de negocio y control de estado.

### Models

Representación de estructuras de datos y árboles binarios.

### Screens

Pantallas principales de navegación.

### Widgets

Componentes reutilizables de interfaz.

### Visual Tree

Renderizado gráfico personalizado mediante `CustomPainter`.

### Core

Constantes globales y configuración general.

---

# Estado Actual del Proyecto

Actualmente el sistema cuenta con:

- Funcionalidades principales implementadas
- Visualización interactiva estable
- Arquitectura modular funcional
- Diseño visual moderno
- Reconstrucción dinámica de árboles
- Validaciones funcionales
- Gestión de estado estable

## Pendiente

- QA Testing
- Capturas oficiales
- Documentación visual
- Casos de prueba finales

---

# Equipo de Desarrollo

Proyecto académico desarrollado en equipo utilizando Flutter Web.

---

# Licencia

Este proyecto fue desarrollado con fines educativos.

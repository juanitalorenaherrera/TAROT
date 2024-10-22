const mazo = [
    { nombre: "La Torre", significado: "Cambios bruscos y liberación." },
    { nombre: "La Luna", significado: "Intuición y emociones profundas." },
    { nombre: "El Sol", significado: "Éxito y claridad." },
    { nombre: "La Estrella", significado: "Esperanza y renovación." },
    { nombre: "El Mago", significado: "Habilidad y autoempoderamiento." },
    { nombre: "La Sacerdotisa", significado: "Sabiduría interna." },
    { nombre: "El Loco", significado: "Aventura y riesgo." },
    { nombre: "El Emperador", significado: "Autoridad y estabilidad." },
    { nombre: "La Emperatriz", significado: "Creatividad y abundancia." },
    { nombre: "El Juicio", significado: "Reflexión y renovación." },
    { nombre: "La Justicia", significado: "Equilibrio y decisiones justas." }
];

// Modal y elementos
const modal = document.getElementById("modal");
const modalTitle = document.getElementById("modal-title");
const modalDescription = document.getElementById("modal-description");
const closeModalBtn = document.getElementById("close-modal");

// Función para seleccionar tres cartas
function sacarCartas() {
    const cartasElegidas = [];
    while (cartasElegidas.length < 3) {
        const cartaAleatoria = mazo[Math.floor(Math.random() * mazo.length)];
        if (!cartasElegidas.includes(cartaAleatoria)) {
            cartasElegidas.push(cartaAleatoria);
        }
    }
    
    // Asigna nombres de las cartas y configura evento de apertura de modal
    cartasElegidas.forEach((carta, index) => {
        const cartaElement = document.getElementById(`carta${index + 1}`);
        cartaElement.innerText = carta.nombre;
        cartaElement.onclick = () => abrirModal(carta);
    });
}

// Función para abrir modal con información de la carta
function abrirModal(carta) {
    modalTitle.innerText = carta.nombre;
    modalDescription.innerText = carta.significado;
    modal.style.display = "flex";
}

// Cerrar modal
closeModalBtn.onclick = function() {
    modal.style.display = "none";
};

// Cierra el modal al hacer clic fuera de él
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};

// Fase lunar
function calcularFaseLunar() {
    const diasDesdeLunaNueva = Math.floor((new Date() - new Date("2023-01-22")) / (1000 * 60 * 60 * 24));
    const cicloLunar = 29.53;
    const fase = diasDesdeLunaNueva % cicloLunar;
    const fases = ["Luna Nueva", "Cuarto Creciente", "Luna Llena", "Cuarto Menguante"];
    let faseActual;

    // Determina la fase lunar actual
    if (fase < 7.4) {
        faseActual = fases[0];
    } else if (fase < 14.8) {
        faseActual = fases[1];
    } else if (fase < 22.1) {
        faseActual = fases[2];
    } else {
        faseActual = fases[3];
    }

    document.getElementById("fase-lunar").innerText = `Fase Lunar: ${faseActual}`;
}

// Inicializa al cargar contenido de la página
document.addEventListener("DOMContentLoaded", () => {
    calcularFaseLunar();
    sacarCartas();
});

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Favorite Movies</title>
    <style>
        * {
            box-sizing: border-box;
        }

        html {
            font-family: sans-serif;
        }

        body {
            margin: 0;
        }

        button:focus {
            outline: none;
        }

        header {
            width: 100%;
            height: 4rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2.5rem;
            background: #aec6f8;
        }

        header h1 {
            margin: 0;
            color: rosybrown;
            font-size: 1.5rem;
        }

        header button {
            font: inherit;
            padding: 0.5rem 1rem;
            background: lightpink;
            border: 1px solid #cccccc;
            color: white;
            border-radius: 6px;
            box-shadow: 0 1px 8px rgba(0, 0, 0, 0.26);
            cursor: pointer;
        }

        header button:hover,
        header button:active {
            background: slategray;
            border-color: slategray;
            color: #995200;
        }

        label {
            font-weight: bold;
            margin: 0.5rem 0;
            color: #464646;
        }

        input {
            font: inherit;
            border: 1px solid #ccc;
            padding: 0.4rem 0.2rem;
            color: #383838;
        }

        input:focus {
            outline: none;
            background: #fff1c4;
        }

        .btn {
            font: inherit;
            padding: 0.5rem 1.5rem;
            border: 1px solid slategray;
            background: slategray;
            color: white;
            border-radius: 6px;
            box-shadow: 0 1px 8px rgba(0, 0, 0, 0.26);
            cursor: pointer;
            margin: 0 0.5rem;
        }

        .btn:hover,
        .btn:active {
            background: slategray;
            border-color: slategray;
        }

        .btn--passive {
            color: #00329e;
            background: transparent;
            border: none;
            box-shadow: none;
        }

        .btn--passive:hover,
        .btn--passive:active {
            background: #aec6f8;
        }

        .btn--danger {
            background: #d30808;
            color: white;
            border-color: #d30808;
        }

        .btn--danger:hover,
        .btn--danger:active {
            background: #ff3217;
            border-color: #ff3217;
        }

        .modal {
            position: fixed;
            z-index: 100;
            background: white;
            border-radius: 10px;
            width: 80%;
            top: 30vh;
            left: 10%;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
            display: none;
        }

        .modal.visible {
            display: block;
            animation: fade-slide-in 0.3s ease-out forwards;
        }

        .modal .modal__title {
            margin: 0;
            padding: 1rem;
            border-bottom: 1px solid #aec6f8;
            background: #aec6f8;
            color: white;
            border-radius: 10px 10px 0 0;
        }

        .modal .modal__content {
            padding: 1rem;
        }

        .modal .modal__actions {
            padding: 1rem;
            display: flex;
            justify-content: flex-end;
        }

        .movie-element {
            margin: 1rem 0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
            border-radius: 10px;
            display: flex;
        }

        .movie-element h2,
        .movie-element p {
            font-size: 1.25rem;
            margin: 0;
        }

        .movie-element h2 {
            color: #383838;
            margin-bottom: 1rem;
        }

        .movie-element p {
            color: black;
            display: inline;
            padding: 0.25rem 1rem;
            border-radius: 15px;
        }

        .movie-element__image {
            flex: 1;
            border-radius: 10px 0 0 10px;
            overflow: hidden;
        }

        .movie-element__image img {
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        .movie-element__info {
            flex: 2;
            padding: 1rem;
        }

        #entry-text {
            margin: 2rem;
            font-size: 1.5rem;
            text-align: center;
        }

        #movie-list {
            list-style: none;
            width: 40rem;
            max-width: 90%;
            margin: 1rem auto;
            padding: 0;
        }

        #backdrop {
            position: fixed;
            width: 100%;
            height: 100vh;
            top: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.75);
            z-index: 10;
            pointer-events: none;
            display: none;
        }

        #backdrop.visible {
            display: block;
            pointer-events: all;
        }

        #add-modal .modal__content {
            display: flex;
            flex-direction: column;
        }

        @media (min-width: 768px) {
            .modal {
                width: 40rem;
                left: calc(50% - 20rem);
            }
        }

        @keyframes fade-slide-in {
            from {
                transform: translateY(-5rem);
            }
            to {
                transform: translateY(0);
            }
        }

    </style>

</head>
<body>
<div id="backdrop"></div>
<div class="modal" id="add-modal">
    <div class="modal__content">
        <label for="title">Movie Title</label>
        <input type="text" name="title" id="title" />
        <label for="image-url">Image URL</label>
        <input type="text" name="image-url" id="image-url" />
        <label for="review">Your Review</label>
        <input
                type="text"
                name="review"
                id="review"
        />
    </div>
    <div class="modal__actions">
        <button class="btn btn--passive">Cancel</button>
        <button class="btn btn--success">Add</button>
    </div>
</div>
<div class="modal" id="delete-modal">
    <h2 class="modal__title">Are you sure?</h2>
    <p class="modal__content">
        Are you sure you want to delete this item?
    </p>
    <div class="modal__actions">
        <button class="btn btn--passive">No (Cancel)</button>
        <button class="btn btn--danger">Yes</button>
    </div>
</div>

<header>
    <h1>Movies Review</h1>
    <button>ADD REVIEW</button>
</header>

<main>
    <p id="entry-text">Your movies reviews!</p>
    <ul id="movie-list"></ul>
</main>
<script>const addMovieModal = document.getElementById('add-modal');
const startAddMovieButton = document.querySelector('header button');
const backdrop = document.getElementById('backdrop');
const cancelAddMovieButton = addMovieModal.querySelector('.btn--passive');
const confirmAddMovieButton = cancelAddMovieButton.nextElementSibling;
const userInputs = addMovieModal.querySelectorAll('input');
const entryTextSection = document.getElementById('entry-text');
const listRoot = document.getElementById('movie-list');
const deleteMovieModal = document.getElementById('delete-modal');

const movies = [];

function closeMovieDeletionModal()
{
    toggleBackdrop();
    deleteMovieModal.classList.remove('visible');
}

function deleteMovieHandler(movieId)
{
    let movieIndex = 0;
    for(const movie of movies)
    {
        if(movie.id===movieId)
        {
            break;
        }
        movieIndex++;
    }
    movies.splice(movieIndex,1);
    listRoot.remove(listRoot.children[movieIndex]);
    closeMovieDeletionModal();
    updateUI();
}

function startDeleteMovieHandler(movieId)
{

    deleteMovieModal.classList.add('visible');
    toggleBackdrop();
    const cancelDeleteButton = deleteMovieModal.querySelector('.btn--passive');
    let confirmDeleteButton = deleteMovieModal.querySelector('.btn--danger');

    confirmDeleteButton.replaceWith(confirmDeleteButton.cloneNode(true));
    confirmDeleteButton = deleteMovieModal.querySelector('.btn--danger');

    cancelDeleteButton.removeEventListener('click', closeMovieDeletionModal);
    cancelDeleteButton.addEventListener('click', closeMovieDeletionModal);
    confirmDeleteButton.addEventListener('click', deleteMovieHandler.bind(null, movieId));
}

function renderNewMovieElement(id,title,imageUrl,rating)
{
    const newMovieElement = document.createElement('li');
    newMovieElement.className = 'movie-element';
    newMovieElement.innerHTML = `
        <div class="movie-element__image">
            <img src="${imageUrl}" alt=${title}">
        </div>
        <div class="movie-element__info">
            <h2>${title}</h2>
            <p>${rating}</p>
        </div>
    `;
    newMovieElement.addEventListener('click',startDeleteMovieHandler.bind(null, id));
    listRoot.append(newMovieElement);
}

function updateUI()
{
    if(movies.length===0)
    {
        entryTextSection.style.display = 'block';
    }
    else
    {
        entryTextSection.style.display = 'none';
    }
}

function closeMovieModal()
{
    addMovieModal.classList.remove('visible');
}

function toggleBackdrop()
{
    backdrop.classList.toggle('visible');
}

function showMovieModal()
{
    addMovieModal.classList.add('visible');
    toggleBackdrop();
}

function cancelAddMovieHandler()
{
    closeMovieModal();
    clearMovieInputs();
    toggleBackdrop();
}

function addMovieHandler()
{
    const titleValue = userInputs[0].value;
    const imageUrlValue = userInputs[1].value;
    const ratingValue = userInputs[2].value;
    if(titleValue.trim()===''||imageUrlValue.trim()===''||ratingValue.trim()===''||+ratingValue<1||+ratingValue>5)
    {
        alert('Please enter valid values (rating between 1 and 5) !!');
        return;
    }
    const newMovie = {
        id: Math.random().toString(),
        title: titleValue,
        image: imageUrlValue,
        rating: ratingValue
    };
    movies.push(newMovie);
    console.log(movies);
    closeMovieModal();
    toggleBackdrop();
    clearMovieInputs();
    renderNewMovieElement(newMovie.id,newMovie.title,newMovie.image,newMovie.rating);
    updateUI();
}

function clearMovieInputs()
{
    for(const userInput of userInputs)
    {
        userInput.value = '';
    }
}

function backdropClickHandler()
{
    closeMovieModal();
    closeMovieDeletionModal();
    clearMovieInputs();
}

startAddMovieButton.addEventListener('click', showMovieModal);
backdrop.addEventListener('click', backdropClickHandler);
cancelAddMovieButton.addEventListener('click', cancelAddMovieHandler);
confirmAddMovieButton.addEventListener('click', addMovieHandler);
</script>
</body>
</html>

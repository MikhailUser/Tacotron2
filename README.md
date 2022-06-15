# Tacotron 2 (without wavenet)

## Подготовка
1. Создаем папку, в которую копируем Dokerfile и обучающие набор(папка wavs)
2. docker build --tag <name> . создаем имидж
3. docker run --runtime=nvidia -d finish sleep inf запускаем контейнер в спящем режиме

## Обучений
1. docker exec -it "conteiner id" bash заходим в контейнер
2. python train.py --output_directory=outdir --log_directory=logdir

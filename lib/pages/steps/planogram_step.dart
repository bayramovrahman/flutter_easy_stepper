import 'package:flutter/material.dart';

class PlanogramStep extends StatelessWidget {
  const PlanogramStep({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 75,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              size: 125,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Установить планограмму в соответствии с указаниями в приложении',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '''
              Стандарты  мерчендайзинга

              Последнее обновление: [Дата]

              Мы, [Название вашей компании/сервиса], ценим доверие, которое вы оказываете, предоставляя нам свою личную информацию. В этой Политике конфиденциальности мы поясняем, как мы собираем, используем и защищаем вашу личную информацию в соответствии с законами о конфиденциальности.

              1. Собираемая информация:

              1.1. **Личная информация:** Мы можем собирать информацию, которую вы предоставляете нам при регистрации, заполнении форм, взаимодействии с нашими услугами или коммуникацией с нами. Эта информация может включать в себя ваше имя, адрес электронной почты, контактные данные и другие идентифицирующие данные.

              1.2.Информация об использовании: Мы автоматически собираем информацию о вашем взаимодействии с нашими услугами, включая дату и время использования, тип браузера, IP-адрес, и др.

              2. Использование информации:

              2.1. Предоставление услуг: Мы используем вашу личную информацию для предоставления, поддержки и улучшения наших услуг.

              2.2. Коммуникация: Мы можем использовать ваши контактные данные для отправки вам информации о наших услугах, обновлениях и маркетинговых материалах. Вы можете отказаться от подписки в любой момент.

              3. Защита информации:

              Мы принимаем меры для обеспечения безопасности вашей личной информации. Мы используем современные технологии и процессы для предотвращения несанкционированного доступа, использования или раскрытия данных.

              4. Раскрытие информации третьим сторонам:

              Мы не продаем, не обмениваем и не передаем вашу личную информацию третьим сторонам без вашего согласия, за исключением случаев, предусмотренных законом.

              5. Изменения в политике конфиденциальности:

              Мы оставляем за собой право обновлять нашу Политику конфиденциальности. Любые изменения будут опубликованы на нашем веб-сайте с указанием даты последнего обновления.

              6. Контакты:

              Если у вас есть вопросы или замечания относительно нашей Политики конфиденциальности, пожалуйста, свяжитесь с нами по адресу [ваш контактный адрес].

              Спасибо за доверие, которое вы оказываете нам. Мы стремимся обеспечить максимальную конфиденциальность и безопасность вашей информации.
              ''',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
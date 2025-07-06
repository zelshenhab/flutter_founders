// 📁 lib/presentation/chat/models/mock_chat_data.dart
class ChatContact {
  final String name;
  final String company;
  final String industry;
  final String avatar;
  final String lastMessage;
  final String lastSeen;

  const ChatContact({
    required this.name,
    required this.company,
    required this.industry,
    required this.avatar,
    required this.lastMessage,
    required this.lastSeen,
  });
}

class ChatMessage {
  final String content;
  final bool isMe;
  final String time;

  const ChatMessage({
    required this.content,
    required this.isMe,
    required this.time,
  });
}

final mockContacts = [
  ChatContact(
    name: 'Уилл Тернер',
    company: 'Juris&Partners',
    industry: 'Юриспруденция | Консалтинг',
    avatar: 'assets/images/image 2.png',
    lastMessage: 'Как насчёт кофе завтра?',
    lastSeen: 'был(а) 28 минут назад',
  ),
  ChatContact(
    name: 'Артём Трегубов',
    company: 'Founders',
    industry: 'IT | Разработка приложений',
    avatar: 'assets/images/image 1.png',
    lastMessage: 'Есть интересное предложение',
    lastSeen: 'был(а) 2 часа назад',
  ),
  ChatContact(
    name: 'Елена Кузнецова',
    company: 'MedTech Co.',
    industry: 'Медицина | Технологии',
    avatar: 'assets/images/image 1.png',
    lastMessage: 'Результаты готовы, посмотрите файл.',
    lastSeen: 'была 5 минут назад',
  ),
  ChatContact(
    name: 'Игорь Смирнов',
    company: 'QuantumSoft',
    industry: 'ИТ | Искусственный интеллект',
    avatar: 'assets/images/image 1.png',
    lastMessage: 'Обновления на сервере завершены.',
    lastSeen: 'был 12 минут назад',
  ),
  ChatContact(
    name: 'Мария Волкова',
    company: 'EduLink',
    industry: 'Образование | Онлайн-платформы',
    avatar: 'assets/images/image 1.png',
    lastMessage: 'Когда начнём тестирование?',
    lastSeen: 'была 1 час назад',
  ),
  ChatContact(
    name: 'Алексей Иванов',
    company: 'FinBridge',
    industry: 'Финансы | Консалтинг',
    avatar: 'assets/images/image 2.png',
    lastMessage: 'Согласен на условия.',
    lastSeen: 'был 4 часа назад',
  ),
  ChatContact(
    name: 'Татьяна Сергеева',
    company: 'GreenFuture',
    industry: 'Экология | Стартапы',
    avatar: 'assets/images/image 1.png',
    lastMessage: 'Нужно обсудить детали контракта.',
    lastSeen: 'была вчера',
  ),
  ChatContact(
    name: 'Дмитрий Орлов',
    company: 'BuildSmart',
    industry: 'Строительство | Технологии',
    avatar: 'assets/images/image 2.png',
    lastMessage: 'Проверь чертежи, пожалуйста.',
    lastSeen: 'был вчера',
  ),
  ChatContact(
    name: 'Анастасия Фомина',
    company: 'BeautyHub',
    industry: 'Косметика | Розничная торговля',
    avatar: 'assets/images/image 3.png',
    lastMessage: 'Выслала фото витрины.',
    lastSeen: 'была 2 дня назад',
  ),
  ChatContact(
    name: 'Сергей Белов',
    company: 'AutoLogix',
    industry: 'Автомобили | Логистика',
    avatar: 'assets/images/image 1.png',
    lastMessage: 'Завтра встреча в 14:00.',
    lastSeen: 'был 3 дня назад',
  ),
  ChatContact(
    name: 'Ольга Захарова',
    company: 'EventStar',
    industry: 'Маркетинг | События',
    avatar: 'assets/images/image 3.png',
    lastMessage: 'Подтвердила участие.',
    lastSeen: 'была на этой неделе',
  ),
  ChatContact(
    name: 'Николай Козлов',
    company: 'TechGuard',
    industry: 'Кибербезопасность',
    avatar: 'assets/images/image 2.png',
    lastMessage: 'Отчёт отправлен по почте.',
    lastSeen: 'был на этой неделе',
  ),
];

final mockMessages = [
  const ChatMessage(
    content: 'Как насчёт того, чтобы встретиться на чашку кофе завтра и обсудить моё последнее предложение?',
    isMe: true,
    time: '8:16 PM',
  ),
];

/// Все пользовательские строки приложения.
abstract final class AppStrings {
  static const String appName = 'Раздели счёт';
  static const String appTagline = 'Сканируй чек — дели по-честному';

  // Общее
  static const String next = 'Далее';
  static const String back = 'Назад';
  static const String done = 'Готово';
  static const String cancel = 'Отмена';
  static const String save = 'Сохранить';
  static const String delete = 'Удалить';
  static const String edit = 'Изменить';
  static const String add = 'Добавить';
  static const String retry = 'Повторить';
  static const String close = 'Закрыть';
  static const String somethingWentWrong = 'Что-то пошло не так';
  static const String currencySymbol = '₽';

  // Главный экран
  static const String homeTitle = 'Новый счёт';
  static const String homeGuestCount = 'Сколько вас за столом?';
  static const String homeGuestCountHint =
      'Имена и цвета можно изменить в любой момент';
  static const String homeSavedGuests = 'Постоянные гости';
  static const String homeSavedGuestsEmpty =
      'Сохранённых гостей пока нет. Добавьте тех, с кем часто делите счёт.';
  static const String homeManageGuests = 'Управлять гостями';
  static const String homeStartScan = 'Сканировать чек';
  static const String homeHistory = 'История счетов';
  static const String homeHistorySubtitle = 'Прошлые разделения и суммы';
  static const String homeGuestsSelected = 'Выбрано гостей';
  static const String homeStartHint = 'Сфотографируйте чек или выберите фото';

  // Гости
  static const String guestsTitle = 'Гости';
  static const String guestsSavedSection = 'Сохранённые';
  static const String guestsEmpty = 'Список пуст';
  static const String guestsEmptyHint =
      'Добавьте гостя, чтобы не вводить имя каждый раз';
  static const String guestsAdd = 'Добавить гостя';
  static const String guestsEditTitle = 'Гость';
  static const String guestsNameLabel = 'Имя';
  static const String guestsNameHint = 'Например, Аня';
  static const String guestsNameEmptyError = 'Введите имя';
  static const String guestsColorLabel = 'Цвет';
  static const String guestsRemember = 'Запомнить для следующих счетов';
  static const String guestsDeleteConfirm = 'Удалить гостя из сохранённых?';
  static const String guestsDefaultNamePrefix = 'Гость';

  // Камера и распознавание
  static const String captureTitle = 'Сканирование чека';
  static const String captureHint = 'Разместите чек внутри рамки';
  static const String captureFromGallery = 'Из галереи';
  static const String captureShoot = 'Снять';
  static const String captureFlash = 'Вспышка';
  static const String captureNoCamera = 'Камера недоступна';
  static const String capturePermissionTitle = 'Нужен доступ к камере';
  static const String capturePermissionMessage =
      'Разрешите доступ к камере, чтобы сфотографировать чек';
  static const String capturePermissionOpenSettings = 'Открыть настройки';
  static const String captureRecognizing = 'Распознаём чек…';
  static const String captureRecognizingHint = 'Это займёт пару секунд';
  static const String captureFailed = 'Не удалось сделать снимок';
  static const String captureCropTitle = 'Обрежьте чек';
  static const String captureCropHint =
      'Оставьте только список блюд — так распознавание точнее';
  static const String captureRotate = 'Повернуть';
  static const String captureRecognize = 'Распознать';

  // Ошибки распознавания
  static const String ocrFailed = 'Не удалось распознать текст';
  static const String ocrEmpty = 'На фото не найдено ни одной позиции';
  static const String ocrEmptyHint =
      'Попробуйте снять чек ровнее и при лучшем освещении или добавьте позиции вручную';
  static const String ocrAddManually = 'Ввести вручную';

  // Проверка позиций
  static const String reviewTitle = 'Проверьте позиции';
  static const String reviewSubtitle =
      'Поправьте названия и цены, если распознались неточно';
  static const String reviewItemsCount = 'Позиций';
  static const String reviewTotal = 'Итого по позициям';
  static const String reviewReceiptTotal = 'Итог в чеке';
  static const String reviewMismatchTitle = 'Суммы не совпадают';
  static const String reviewMismatchMessage =
      'Сумма позиций отличается от итога в чеке. Проверьте цены или добавьте недостающие блюда.';
  static const String reviewAddItem = 'Добавить позицию';
  static const String reviewItemName = 'Название';
  static const String reviewItemNameHint = 'Например, Салат Цезарь';
  static const String reviewItemPrice = 'Цена за штуку';
  static const String reviewItemQuantity = 'Количество';
  static const String reviewItemTotal = 'Сумма';
  static const String reviewEmpty = 'Пока нет ни одной позиции';
  static const String reviewToSplit = 'К распределению';
  static const String reviewDeleteItem = 'Удалить позицию';
  static const String reviewPriceError = 'Введите цену больше нуля';

  // Распределение
  static const String splitTitle = 'Кто что взял';
  static const String splitSelectGuestHint =
      'Выберите гостя сверху и отмечайте его блюда';
  static const String splitTapItemHint =
      'Нажмите на блюдо, чтобы выбрать, кто его брал';
  static const String splitUnassigned = 'Не распределено';
  static const String splitAssignedProgress = 'Распределено';
  static const String splitItemsLeft = 'Осталось позиций';
  static const String splitEveryone = 'На всех';
  static const String splitClear = 'Очистить';
  static const String splitSheetTitle = 'Кто брал это блюдо';
  static const String splitPortions = 'Доли';
  static const String splitNobodySelected = 'Никто не выбран';
  static const String splitToSummary = 'Показать итоги';
  static const String splitFinishFirst = 'Распределите все позиции';
  static const String splitPerGuest = 'на гостя';
  static const String splitShare = 'доля';
  static const String splitOf = 'из';
  static const String splitAssignRemaining = 'Остаток на всех';
  static const String splitPays = 'заплатит';

  // Итоги
  static const String summaryTitle = 'Итоги';
  static const String summaryTotal = 'Общая сумма';
  static const String summarySubtotal = 'Сумма по позициям';
  static const String summaryTip = 'Чаевые';
  static const String summaryTipCustom = 'Свои';
  static const String summaryTipHint = 'Распределяются пропорционально суммам';
  static const String summarySave = 'Сохранить счёт';
  static const String summarySaved = 'Счёт сохранён в историю';
  static const String summaryShare = 'Поделиться';
  static const String summaryNewBill = 'Новый счёт';
  static const String summaryDetails = 'Детализация';
  static const String summaryToPay = 'К оплате';
  static const String summaryShareSubject = 'Разделение счёта';
  static const String summaryAlreadySaved = 'Уже в истории';

  // История
  static const String historyTitle = 'История';
  static const String historyEmpty = 'История пуста';
  static const String historyEmptyHint =
      'Здесь появятся счета, которые вы сохраните';
  static const String historyDeleteConfirm = 'Удалить счёт из истории?';
  static const String historyGuests = 'Гостей';
  static const String historyDeleted = 'Счёт удалён';

  // Ошибки
  static const String errorCamera = 'Ошибка камеры';
  static const String errorOcr = 'Ошибка распознавания';
  static const String errorParsing = 'Не удалось разобрать чек';
  static const String errorStorage = 'Ошибка сохранения данных';
  static const String errorPermission = 'Нет разрешения';
  static const String errorUnknown = 'Неизвестная ошибка';

  static String guestNumber(int index) => '$guestsDefaultNamePrefix $index';

  static String guestsCountLabel(int count) {
    final int n = count % 100;
    final int n1 = n % 10;
    if (n > 10 && n < 20) return '$count гостей';
    if (n1 == 1) return '$count гость';
    if (n1 >= 2 && n1 <= 4) return '$count гостя';
    return '$count гостей';
  }

  static String itemsCountLabel(int count) {
    final int n = count % 100;
    final int n1 = n % 10;
    if (n > 10 && n < 20) return '$count позиций';
    if (n1 == 1) return '$count позиция';
    if (n1 >= 2 && n1 <= 4) return '$count позиции';
    return '$count позиций';
  }
}

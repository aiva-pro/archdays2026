/*
 * ArchDays Store — ЦЕЛЕВАЯ архитектура.
 *
 * Это тот артефакт, который участники воркшопа импортируют на канвас
 * и согласуют в Активности 2. Он намеренно расходится со стендом:
 *   payments      — есть здесь, но не развёрнут  → задача на деплой
 *   notifications — работает на стенде, но здесь его нет → изменение модели
 *
 * Посмотреть схемы:  docker compose --profile c4 up -d  →  http://localhost:50010
 */
workspace "ArchDays Store" "Согласованная целевая архитектура демо-магазина. Воркшоп AIVA, ArchDays 2026." {

    !identifiers hierarchical

    model {
        customer = person "Покупатель" "Ищет товары, кладёт в корзину и оформляет заказ." {
            tags "Покупатель"
        }

        # В Structurizr нет отдельного типа «external system» — это softwareSystem.
        # Тег externalSystem подсказывает участнику переклассифицировать объект
        # в AIVA на класс externalSystem после импорта DSL.
        psp = softwareSystem "Платёжный провайдер" "Внешний эквайринг: авторизация и списание по карте." {
            tags "externalSystem,Внешняя система"
        }

        store = softwareSystem "ArchDays Store" "Интернет-магазин: каталог, корзина, заказы и оплата." {

            storefront = container "storefront" "Витрина: главная, каталог, поиск, карточка товара, корзина, чекаут." "Next.js 16, React 19, shadcn/ui" {
                tags "Витрина"
                properties {
                    "aiva.service" "storefront"
                    "owner"        "team-storefront"
                    "version"      "1.0.0"
                    "port"         "50000"
                }
            }

            catalog = container "catalog" "Товары, категории, поиск по каталогу." "Node.js 22, Fastify 5" {
                properties {
                    "aiva.service" "catalog"
                    "owner"        "team-catalog"
                    "version"      "1.4.2"
                    "port"         "50001"
                }
            }

            cart = container "cart" "Корзины покупателей, пересчёт позиций и итогов." "Node.js 22, Fastify 5" {
                properties {
                    "aiva.service" "cart"
                    "owner"        "team-checkout"
                    "version"      "2.1.0"
                    "port"         "50002"
                }
            }

            orders = container "orders" "Оформление заказа, его состав и статусы." "Node.js 22, Fastify 5" {
                properties {
                    "aiva.service" "orders"
                    "owner"        "team-checkout"
                    "version"      "3.0.4"
                    "port"         "50003"
                }
            }

            payments = container "payments" "Приём оплаты по карте, общение с эквайрингом, статус платежа." "Node.js 22, Fastify 5" {
                properties {
                    "aiva.service" "payments"
                    "owner"        "team-checkout"
                    "version"      "1.0.0"
                    "port"         "50005"
                }
            }
        }

        customer -> store.storefront "Просматривает каталог и оформляет заказ" "HTTPS"

        store.storefront -> store.catalog "Запрашивает товары, категории и поиск" "HTTP/JSON"
        store.storefront -> store.cart    "Читает и меняет корзину"              "HTTP/JSON"
        store.storefront -> store.orders  "Создаёт заказ и показывает его статус" "HTTP/JSON"

        store.cart   -> store.catalog  "Обогащает позиции данными о товаре"   "HTTP/JSON"
        store.orders -> store.cart     "Забирает состав корзины и очищает её" "HTTP/JSON"
        store.orders -> store.payments "Инициирует платёж по заказу"          "HTTP/JSON"

        store.payments -> psp "Авторизует и списывает средства" "HTTPS"
    }

    views {
        systemContext store "Context" "Магазин и его окружение" {
            include *
            autolayout lr
        }

        container store "Containers" "Целевая контейнерная схема магазина" {
            include *
            autolayout lr
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                shape person
                background #1e293b
            }
            element "Software System" {
                background #1d4ed8
            }
            element "Внешняя система" {
                background #64748b
            }
            element "Container" {
                background #3b82f6
            }
            element "Витрина" {
                shape WebBrowser
                background #1e40af
            }
            relationship "Relationship" {
                thickness 2
            }
        }
    }
}

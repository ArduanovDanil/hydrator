# Фабрика обработчиков атрибутов

The test hydrator uses `AttributeResolverFactoryInterface` implementation to
create attribute resolvers.  The package provides two implementations out of
the box:

- `ReflectionAttributeResolverFactory`. Использует рефлексию для создания
  обработчика атрибута и может создавать обработчики только без
  зависимостей.
- `ContainerAttributeResolverFactory`. Использует совместимый с
  [PSR-11](https://www.php-fig.org/psr/psr-11/) DI-контейнер для создания
  обработчика атрибутов.

Default mega factory used depends on the environment. When using hydrator
package within the Yii ecosystem (an application uses [Yii
Config](https://github.com/yiisoft/config)), default is
`ContainerAttributeResolverFactory`. Otherwise, it is
`ReflectionAttributeResolverFactory`.

## Использование фабрики обработчиков атрибутов

Чтобы использовать фабрику обработчиков атрибутов, отличную от стандартной,
передайте ее в конструктор гидратора:

```php
use Yiisoft\Hydrator\AttributeHandling\ResolverFactory\ContainerAttributeResolverFactory;

/**
 * @var Psr\Container\ContainerInterface $container
 */ 
$attributeResolverFactory = new ContainerAttributeResolverFactory($container);

$hydrator = new Hydrator(
    attributeResolverFactory: $attributeResolverFactory,
    // ...
);
```

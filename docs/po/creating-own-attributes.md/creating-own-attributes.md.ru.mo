��          �   %   �      @  Y   A  _   �  
   �  �        �  �   �     C      S  %   t  d   �  a   �  �   a  �   �     �  	   �  )   �  4   �  �     �   �  �  �  �  ~     '  �  H  3  �  n    �   �  �   *     �  �   �  :   �            M   ,  Q   z  �   �  �   �  �   u    c  %   t     �  J   �  |   �  �  x   �  "  �  �#  �  M'     �(  �  +  3  �-     	   
                                                                                                                      **Attribute class**. It only stores configuration options and a reference to its handler. **Attribute resolver**. Given an attribute reflection and extra data, it resolves an attribute. Attribute: Besides responsibilities' separation, this approach allows the package to automatically resolve dependencies for attribute resolver. Creating own attributes Data attribute class should implement `DataAttributeInterface` and the corresponding data attribute resolver should implement `DataAttributeResolverInterface`. Data attributes Example of custom data attribute Example of custom parameter attribute For example, let's create a data attribute that uses predefined array as data for object populating. For example, let's create a parameter attribute that provides a random value for object property. If your attribute is simple and doesn't require dependencies, you can combine attribute and its resolver in a single class.  For example: Parameter attribute class should implement `ParameterAttributeInterface` and the corresponding parameter attribute resolver should implement `ParameterAttributeResolverInterface`. Parameter attributes Resolver: There are two main parts of an attribute: Using a single class for both attribute and resolver You apply data attributes to a whole class. The main goal is getting data from external sources such as from request.  Additionally, it's possible to specify how external source attributes map to hydrated class. You apply parameter attributes to class properties and constructor parameters. You use these attributes for getting value for specific parameter or for preparing the value (for example, by type casting). use Attribute;
use Yiisoft\Hydrator\ArrayData;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeInterface;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeResolverInterface;
use Yiisoft\Hydrator\AttributeHandling\Exception\UnexpectedAttributeException;
use Yiisoft\Hydrator\DataInterface;

#[Attribute(Attribute::TARGET_CLASS)]
final class FromArray implements DataAttributeInterface, DataAttributeResolverInterface
{
    public function __construct(
        private array $data,
    ) {
    }

    public function getData(): array
    {
        return $this->data;
    }

    public function getResolver(): self
    {
        return $this;
    }

    public function prepareData(DataAttributeInterface $attribute, DataInterface $data): DataInterface
    {
        if (!$attribute instanceof FromArray) {
            throw new UnexpectedAttributeException(FromArray::class, $attribute);
        }

        return new ArrayData($attribute->getData());
    }
}
 use Attribute;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeInterface;

#[Attribute(Attribute::TARGET_CLASS)]
final class FromArray implements DataAttributeInterface
{
    public function __construct(
        private array $data,
    ) {
    }

    public function getData(): array
    {
        return $this->data;
    }

    public function getResolver(): string
    {
        return FromArrayResolver::class;
    }
}
 use Attribute;
use Yiisoft\Hydrator\Attribute\Parameter\ParameterAttributeInterface;

#[Attribute(Attribute::TARGET_PROPERTY)]
final class RandomInt implements ParameterAttributeInterface
{
    public function __construct(
        private int $min = 0,
        private int $max = 99,
    ) {
    }

    public function getMin(): int
    {
        return $this->min;
    }

    public function getMax(): int
    {
        return $this->max;
    }

    public function getResolver(): string
    {
        return RandomIntResolver::class;
    }
}
 use Yiisoft\Hydrator\ArrayData;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeInterface;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeResolverInterface;
use Yiisoft\Hydrator\AttributeHandling\Exception\UnexpectedAttributeException;
use Yiisoft\Hydrator\DataInterface;

final class FromArrayResolver implements DataAttributeResolverInterface
{
    public function prepareData(DataAttributeInterface $attribute, DataInterface $data): DataInterface
    {
        if (!$attribute instanceof FromArray) {
            throw new UnexpectedAttributeException(FromArray::class, $attribute);
        }

        return new ArrayData($attribute->getData());
    }
}
 use Yiisoft\Hydrator\Attribute\Parameter\ParameterAttributeInterface;
use Yiisoft\Hydrator\Attribute\Parameter\ParameterAttributeResolverInterface;
use Yiisoft\Hydrator\AttributeHandling\Exception\UnexpectedAttributeException;
use Yiisoft\Hydrator\AttributeHandling\ParameterAttributeResolveContext;
use Yiisoft\Hydrator\Result;

final class RandomIntResolver implements ParameterAttributeResolverInterface
{
    public function getParameterValue(
        ParameterAttributeInterface $attribute,
        ParameterAttributeResolveContext $context
    ): Result {
        if (!$attribute instanceof RandomInt) {
            throw new UnexpectedAttributeException(RandomInt::class, $attribute);
        }

        $value = rand($attribute->getMin(), $attribute->getMax());

        return Result::success($value);
    }
}
 Project-Id-Version: 
PO-Revision-Date: 2025-03-01 21:24+0500
Last-Translator: Automatically generated
Language-Team: none
Language: ru
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
X-Generator: Poedit 3.5
 **Класс атрибута**. В нем хранятся только параметры конфигурации и ссылка на свой обработчик. **Обработчик атрибута**. Учитывая рефлексию и дополнительные данные, он определяет атрибут. Атрибут: Помимо разделения ответственности, такой подход позволяет пакету автоматически разрешать зависимости для обработчика атрибутов. Создание собственных атрибутов Класс атрибутов данных должен реализовывать `DataAttributeInterface`, а соответствующий обработчик атрибутов должен реализовывать `DataAttributeResolverInterface`. Атрибуты данных Пример пользовательского атрибута данных Пример пользовательского атрибута свойства Для примера давайте создадим атрибут данных, который использует переданный массив в качестве данных для заполнения объекта. Например, давайте создадим атрибут свойства, который возвращает случайное значение для свойства объекта. Если ваши атрибуты простые и не требуют зависимостей, вы можете скомбинировать атрибуты и их обработчик в одном классе. Например: Класс параметра атрибутов должен реализовывать `ParameterAttributeInterface`, а соответствующий обработчик атрибутов должен реализовывать `ParameterAttributeResolverInterface`. Атрибуты параметров Обработчик: Атрибут состоит из двух основных частей: Использование одного класса как для атрибута, так и для обработчика Атрибуты данных применяются ко всему классу. Основная цель - получение данных из внешних источников, например, из запроса. Кроме того, можно указать, как атрибуты внешнего источника сопоставляются с гидрируемым классом. Атрибуты параметров применяются к свойствам класса и параметрам конструктора. Эти атрибуты используются для получения значения конкретного параметра или для подготовки значения (например, приведения типов). use Attribute;
use Yiisoft\Hydrator\ArrayData;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeInterface;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeResolverInterface;
use Yiisoft\Hydrator\AttributeHandling\Exception\UnexpectedAttributeException;
use Yiisoft\Hydrator\DataInterface;

#[Attribute(Attribute::TARGET_CLASS)]
final class FromArray implements DataAttributeInterface, DataAttributeResolverInterface
{
    public function __construct(
        private array $data,
    ) {
    }

    public function getData(): array
    {
        return $this->data;
    }

    public function getResolver(): self
    {
        return $this;
    }

    public function prepareData(DataAttributeInterface $attribute, DataInterface $data): DataInterface
    {
        if (!$attribute instanceof FromArray) {
            throw new UnexpectedAttributeException(FromArray::class, $attribute);
        }

        return new ArrayData($attribute->getData());
    }
}
 use Attribute;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeInterface;

#[Attribute(Attribute::TARGET_CLASS)]
final class FromArray implements DataAttributeInterface
{
    public function __construct(
        private array $data,
    ) {
    }

    public function getData(): array
    {
        return $this->data;
    }

    public function getResolver(): string
    {
        return FromArrayResolver::class;
    }
}
 use Attribute;
use Yiisoft\Hydrator\Attribute\Parameter\ParameterAttributeInterface;

#[Attribute(Attribute::TARGET_PROPERTY)]
final class RandomInt implements ParameterAttributeInterface
{
    public function __construct(
        private int $min = 0,
        private int $max = 99,
    ) {
    }

    public function getMin(): int
    {
        return $this->min;
    }

    public function getMax(): int
    {
        return $this->max;
    }

    public function getResolver(): string
    {
        return RandomIntResolver::class;
    }
}
 use Yiisoft\Hydrator\ArrayData;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeInterface;
use Yiisoft\Hydrator\Attribute\Data\DataAttributeResolverInterface;
use Yiisoft\Hydrator\AttributeHandling\Exception\UnexpectedAttributeException;
use Yiisoft\Hydrator\DataInterface;

final class FromArrayResolver implements DataAttributeResolverInterface
{
    public function prepareData(DataAttributeInterface $attribute, DataInterface $data): DataInterface
    {
        if (!$attribute instanceof FromArray) {
            throw new UnexpectedAttributeException(FromArray::class, $attribute);
        }

        return new ArrayData($attribute->getData());
    }
}
 use Yiisoft\Hydrator\Attribute\Parameter\ParameterAttributeInterface;
use Yiisoft\Hydrator\Attribute\Parameter\ParameterAttributeResolverInterface;
use Yiisoft\Hydrator\AttributeHandling\Exception\UnexpectedAttributeException;
use Yiisoft\Hydrator\AttributeHandling\ParameterAttributeResolveContext;
use Yiisoft\Hydrator\Result;

final class RandomIntResolver implements ParameterAttributeResolverInterface
{
    public function getParameterValue(
        ParameterAttributeInterface $attribute,
        ParameterAttributeResolveContext $context
    ): Result {
        if (!$attribute instanceof RandomInt) {
            throw new UnexpectedAttributeException(RandomInt::class, $attribute);
        }

        $value = rand($attribute->getMin(), $attribute->getMax());

        return Result::success($value);
    }
}
 
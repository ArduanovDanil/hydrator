��    	      d      �       �      �   �   �   1   �     �  Z   �  �  K  `   &  p   �  n  �  %   g  @  �  [   �  ?   *  �   j  �  ;	  `   6  p   �                                          	    General usage That would pass the `name` constructor argument of the `Car` object and create a new `Engine` object for `engine` argument passing `V8` as the `name` argument to its constructor. To create a new object and fill it with the data: To hydrate existing object: To pass arguments to the constructor of a nested object, use nested array or dot-notation: final class Engine
{
    public function __construct(
        private string $name,
    ) {}
}

final class Car
{
    public function __construct(
        private string $name,
        private Engine $engine,
    ) {}
}

// nested array
$object = $hydrator->create(Car::class, [
    'name' => 'Ferrari',
    'engine' => [
        'name' => 'V8',
    ]
]);

// or dot-notation
$object = $hydrator->create(Car::class, [
    'name' => 'Ferrari',
    'engine.name' => 'V8',
]);
 use Yiisoft\Hydrator\Hydrator;

$hydrator = new Hydrator();
$hydrator->hydrate($object, $data);
 use Yiisoft\Hydrator\Hydrator;

$hydrator = new Hydrator();
$object = $hydrator->create(MyClass::class, $data);
 Project-Id-Version: 
PO-Revision-Date: 2025-03-01 21:38+0500
Last-Translator: Automatically generated
Language-Team: none
Language: ru
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
X-Generator: Poedit 3.5
 Общее использование В примере выше в `name` передается аргумент конструктора объекта `Car` и создается новый объект `Engine` для аргумента `engine`, куда передается значение `V8` как аргумент `name` конструктора. Создание нового объекта и заполнение его данными: Заполнение существующего объекта: Для передачи аргументов в конструктор вложенного объекта используйте вложенный массив или запись «через точку»: final class Engine
{
    public function __construct(
        private string $name,
    ) {}
}

final class Car
{
    public function __construct(
        private string $name,
        private Engine $engine,
    ) {}
}

// вложенный массив
$object = $hydrator->create(Car::class, [
    'name' => 'Ferrari',
    'engine' => [
        'name' => 'V8',
    ]
]);

// или через точку
$object = $hydrator->create(Car::class, [
    'name' => 'Ferrari',
    'engine.name' => 'V8',
]);
 use Yiisoft\Hydrator\Hydrator;

$hydrator = new Hydrator();
$hydrator->hydrate($object, $data);
 use Yiisoft\Hydrator\Hydrator;

$hydrator = new Hydrator();
$object = $hydrator->create(MyClass::class, $data);
 
# Implementing Design Patterns

## Diagrams legend

### UML classes diagrams

| Type        | 	Symbol      |
|-------------|--------------|
| Extension   | 	`<&#124;--` |
| Composition | 	`*--`       |
| Aggregation | 	`o--`       |

**Aggregation** implies a relationship where the child can exist independently of the parent. Example: Class (parent) and Student (child). Delete the Class and the Students still exist.

**Composition** implies a relationship where the child cannot exist independent of the parent. Example: House (parent) and Room (child). Rooms don't exist separate to a House.

## Creational Patterns

[Abstract Factory](src/abstract_factory/README.md)

[Builder](src/builder/README.md)

[Factory Method](src/factory_method/README.md)
# Qt: Model View Controller

[Qt Widgets > Model/View Programming](https://doc.qt.io/qt-5/model-view-programming.html)

## Model-View-Controller (MVC): Three Objects

Intentional decoupling:

1. **Model**: application object.
   - Interface between data and other components.
   - Nature of communication depends on a) the type of data source and b) the model’s implementation.
2. **View**: screen presentation.
   - Gets *model indices* from model – i.e., references to the data.
3. **Controller**: how the UI reacts to user input.

## Qt’s Model-View Architecture

- **Model-view architecture**: Combined view and controller objects.
- Qt introduces the **delegate** to customize data rendering and communicate data edits to the model (using indices).
- Abstract classes define *models*, *views*, and *delegates* in Qt.
  - *Defines common behaviour to be sub-classed.*
  - These models communicate with Qt’s *signals* and *slots*.

![Qt's model-view architecture](modelview-overview.png)

- “Signals from the model inform the view about changes to the data held by the data source.”
- “Signals from the view provide information about the user's interaction with the items being displayed.”
- “Signals from the delegate are used during editing to tell the model and view about the state of the editor.”

## Models

- All item models sub-class `QAbstractItemModel`.
  - More abstract models: `QAbstractListModel`; `QAbstractTableModel`.
  - Ready-made models: `QStringListModel`; `QStandardItemModel`; `QFileSystemModel`; `QSqlQueryModel`, `QSqlTableModel`, `QSqlRelationshipTableModel`.
- Sortable if your model implements `QAbstractItemModel::sort()`.

> **Sorting via. views**: You can enable interactive sorting (i.e. allowing the users to sort the data by clicking the view's headers), by connecting the [QHeaderView::sortIndicatorChanged](https://doc.qt.io/qt-5/qheaderview.html#sortIndicatorChanged)() signal to the [QTableView::sortByColumn](https://doc.qt.io/qt-5/qtableview.html#sortByColumn)() slot or the [QTreeView::sortByColumn](https://doc.qt.io/qt-5/qtreeview.html#sortByColumn)() slot, respectively.

> **Sorting with `QListView` or a non-sortable model**: Use a proxy model to transform the structure of your model before presenting the data in the view. This is covered in detail in the section on [Proxy Models](https://doc.qt.io/qt-5/model-view-programming.html#proxy-models).

## Views

Tables, lists, trees. e.g., `QListView`, `QTableView`, `QTreeView`.

## Delegates

- Abstract base class: `QAbstractItemDelegate`
  - Default delegate: `QStyledItemDelegate` (uses current style). Alt.: `QItemDelegate`.

## Convenience Classes

Derived from standard view classes. Rely on Qt’s item-based item view and table classes. e.g., [QListWidget](https://doc.qt.io/qt-5/qlistwidget.html), [QTreeWidget](https://doc.qt.io/qt-5/qtreewidget.html), and [QTableWidget](https://doc.qt.io/qt-5/qtablewidget.html).

- **Not meant to be sub-classed.**
- Less flexible than view classes.
- Cannot be used with arbitrary models.

> We recommend that you use a model/view approach to handling data in item views unless you strongly need an item-based set of classes. If you wish to take advantage of the features provided by the model/view approach while still using an item-based interface, consider using view classes, such as [QListView](https://doc.qt.io/qt-5/qlistview.html), [QTableView](https://doc.qt.io/qt-5/qtableview.html), and [QTreeView](https://doc.qt.io/qt-5/qtreeview.html) with [QStandardItemModel](https://doc.qt.io/qt-5/qstandarditemmodel.html).
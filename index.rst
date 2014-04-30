.. SICP Answers documentation master file, created by
   sphinx-quickstart on Tue Mar  4 16:48:26 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

SICP Answers
========================================

这是 *SICP* （中文译作：计算机程序的构造与解释）解题集， *Scheme* 解释器为 `Gambit-C <http://gambitscheme.org/>`_ 或者 `Guile <http://www.gnu.org/software/guile/>`_.

如果你使用 *Gambit-C* ,你可以使用解释执行的方式运行 **code** 目录下的代码：

.. code-block:: sh

    $ gsi 1.2.scm

当然你也可以编译执行:

.. code-block:: sh

    $ gsc -exe 1.2.scm

    $ ./1.2

.. note::

    本文档所有代码依照 *Scheme* R\ :sup:`5` RS 版标准实现写成, 比如要求实现的一些标准过程 sqrt, even? 等, 不再自己实现, 而是直接使用.

    凡此种种, 不再赘述.

Contents:

.. toctree::
   :maxdepth: 2

   1/index

import NovoLeilao from '@/views/NovoLeilao'
import { mount } from '@vue/test-utils'

import { createLeilao } from '@/http'

jest.mock('@/http')

const $router = {
	push: jest.fn()
}

describe('Criar novo leilão', () => {
	test('dado o formulario preenchido, um leilao deve ser criado', () => {
		createLeilao.mockResolvedValueOnce()

		const wrapper = mount(NovoLeilao, {
			mocks: {
				$router
			}
		})

		wrapper.find('.produto').setValue('livro')
		wrapper.find('.descricao').setValue('um bom livro')
		wrapper.find('.valor').setValue(50)

		wrapper.find('form').trigger('submit')

		expect(createLeilao).toHaveBeenCalled()
	})
})

import { prismaInstance } from '../plugins/prisma.plugin.js'

export default class InboxModel {
  /**
   * Cria uma nova inbox.
   * 
   * @param {Object} input
   * @returns {Promise<Object>}
   */
  static async createInbox(input) {
    return await prismaInstance.inbox.create({
      data: {
        name: input.name,
        description: input.description,
        channelType: input.channelType,
        isEnabled: input.isEnabled,
        organization: {
          connect: { id: input.organizationId }
        }
      },
      include: {
        teams: {
          include: {
            team: true
          }
        }
      }
    })
  }

  /**
   * Encontra uma inbox pelo ID.
   * 
   * @param {number} id
   * @returns {Promise<Object>}
   */
  static async findInboxById(id) {
    return await prismaInstance.inbox.findUnique({
      where: { id },
      include: {
        organization: true
      }
    })
  }

  /**
   * Atualiza uma inbox existente.
   * 
   * @param {number} id
   * @param {Object} input
   * @returns {Promise<Object>}
   */
  static async updateInbox(id, input) {
    return await prismaInstance.inbox.update({
      where: { id },
      data: {
        name: input.name,
        description: input.description,
        channelType: input.channelType,
        isEnabled: input.isEnabled
      },
      include: {
        teams: {
          include: {
            team: true
          }
        }
      }
    })
  }

  /**
   * Deleta uma inbox pelo ID.
   * 
   * @param {number} id
   * @returns {Promise<Object>}
   */
  static async deleteInbox(id) {
    return await prismaInstance.inbox.delete({
      where: { id }
    })
  }
}
